# frozen_string_literal: true

require 'rails_helper'

describe ScheduledToDo do
  it_behaves_like 'schedulable' do
    let(:presenter) { build(:scheduled_to_do) }
  end

  describe '#valid?' do
    it 'is false if task is not present' do
      scheduled_to_do = build(:scheduled_to_do, task: nil)
      expect(scheduled_to_do.valid?).to eq(false)

      expect(
        scheduled_to_do.errors.messages[:task]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end
  end

  describe '#save' do
    it 'creates a new scheduled to-do' do
      task = 'Buy Christmas presents'
      scheduled_date = 1.week.from_now.to_date

      scheduled_to_do = build(
        :scheduled_to_do,
        task: task,
        scheduled_date: scheduled_date
      )

      expect { scheduled_to_do.save }.to change { ToDo.count }.by(1)

      expect(ToDo.last).to have_attributes(
        task: task,
        scheduled_date: scheduled_date,
        state: 'scheduled'
      )
    end
  end
end
