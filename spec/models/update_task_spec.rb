# frozen_string_literal: true

require 'rails_helper'

describe UpdateTask do
  it_behaves_like 'presentable' do
    let(:expected_attributes) do
      { task: 'New Task' }
    end

    let(:presenter) { build(:update_task, expected_attributes) }
  end

  describe '#valid?' do
    it 'is false if task is not present' do
      update_task = build(:update_task, task: nil)
      expect(update_task.valid?).to eq(false)

      expect(
        update_task.errors.messages[:task]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end
  end
end
