# frozen_string_literal: true

require 'rails_helper'

describe List do
  describe '#valid?' do
    it 'is true for factory' do
      list = build(:list)
      expect(list.valid?).to eq(true)
    end

    it 'is false if name is not present' do
      list = build(:list, name: nil)
      expect(list.valid?).to eq(false)

      expect(
        list.errors.messages[:name]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end
  end

  describe '.persisted' do
    it 'only returns saved lists' do
      list_1 = create(:list)
      _list_2 = build(:list)

      expect(described_class.persisted).to contain_exactly(list_1)
    end
  end

  describe '.expired' do
    it 'returns archived lists past expiry date' do
      list_1 = create(
        :list,
        state: described_class.states[:archived],
        updated_at: (List::EXPIRY_TIME + 1.day).ago
      )
      _list_2 = create(
        :list,
        state: described_class.states[:archived],
        updated_at: (List::EXPIRY_TIME - 1.day).ago
      )
      _list_3 = create(
        :list,
        state: described_class.states[:active],
        updated_at: (List::EXPIRY_TIME + 1.day).ago
      )

      expect(described_class.expired).to contain_exactly(list_1)
    end
  end

  describe '#scheduled_to_dos' do
    it 'returns an instance of ScheduledToDo for each scheduled to-do' do
      list = create(:list)
      to_do_1 = create(:to_do, list: list, state: ToDo.states[:scheduled])
      _to_do_2 = create(:to_do, list: list, state: ToDo.states[:to_do])

      expect(
        list.scheduled_to_dos
      ).to contain_exactly(
        instance_of(ScheduledToDo)
      )

      expect(list.scheduled_to_dos.last.id).to eq(to_do_1.id)
    end
  end

  describe '#api_attributes' do
    it 'returns attributes hash' do
      list = create(:list)
      to_do = create(:to_do, list: list)

      expect(list.api_attributes).to eq(
        {
          id: list.id,
          name: list.name,
          state: list.state,
          to_dos: [to_do.api_attributes]
        }
      )
    end
  end
end
