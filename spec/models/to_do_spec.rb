# frozen_string_literal: true

require 'rails_helper'

describe ToDo do
  describe '#valid?' do
    it 'is true for factory' do
      to_do = build(:to_do)
      expect(to_do.valid?).to eq(true)
    end

    it 'is false if task is not present' do
      to_do = build(:to_do, task: nil)
      expect(to_do.valid?).to eq(false)

      expect(
        to_do.errors.messages[:task]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end

    it 'is false if state is not present' do
      to_do = build(:to_do, state: nil)
      expect(to_do.valid?).to eq(false)

      expect(
        to_do.errors.messages[:state]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end
  end

  describe '.persisted' do
    it 'only returns saved to_dos' do
      to_do_1 = create(:to_do)
      _to_do_2 = build(:to_do)

      expect(described_class.persisted).to contain_exactly(to_do_1)
    end
  end

  describe '.active' do
    it 'only returns to_dos that are not archived' do
      to_do_1 = create(:to_do, state: described_class.states[:to_do])
      to_do_2 = create(:to_do, state: described_class.states[:done])
      _to_do_3 = create(:to_do, state: described_class.states[:archived])

      expect(described_class.active).to contain_exactly(to_do_1, to_do_2)
    end
  end
end
