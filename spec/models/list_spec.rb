# frozen_string_literal: true

require 'rails_helper'

describe List do
  describe '#valid?' do
    it 'is true for factory' do
      list = build(:list)
      expect(list.valid?).to eq(true)
    end

    it 'is false if email is not present' do
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
        state: List.states[:archived],
        updated_at: (List::EXPIRY_TIME + 1.day).ago
      )
      _list_2 = create(
        :list,
        state: List.states[:archived],
        updated_at: (List::EXPIRY_TIME - 1.day).ago
      )
      _list_3 = create(
        :list,
        state: List.states[:active],
        updated_at: (List::EXPIRY_TIME + 1.day).ago
      )

      expect(described_class.expired).to contain_exactly(list_1)
    end
  end
end
