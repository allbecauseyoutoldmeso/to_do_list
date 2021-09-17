# frozen_string_literal: true

require 'rails_helper'

describe ToDo do
  describe '#valid?' do
    it 'is false if task is not present' do
      to_do = build(:to_do, task: nil)
      expect(to_do.valid?).to eq(false)

      expect(
        to_do.errors.messages[:task]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end

    it 'is true if task is present' do
      to_do = build(:to_do, task: 'Post letters')
      expect(to_do.valid?).to eq(true)
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

    it 'is true if state is present' do
      to_do = build(:to_do, state: ToDo.states[:active])
      expect(to_do.valid?).to eq(true)
    end
  end
end
