# frozen_string_literal: true

require 'rails_helper'

describe ScheduledToDo do
  describe '#valid?' do
    it 'is true for factory' do
      to_do = build(:scheduled_to_do)
      expect(to_do.valid?).to eq(true)
    end

    it 'is false if task is not present' do
      to_do = build(:scheduled_to_do, task: nil)
      expect(to_do.valid?).to eq(false)

      expect(
        to_do.errors.messages[:task]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end

    it 'is false if scheduled_date is not present' do
      to_do = build(:scheduled_to_do, scheduled_date: nil)
      expect(to_do.valid?).to eq(false)

      expect(
        to_do.errors.messages[:scheduled_date]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end

    it 'is false if scheduled_date is not in future' do
      to_do = build(:scheduled_to_do, scheduled_date: 1.day.ago)
      expect(to_do.valid?).to eq(false)

      expect(
        to_do.errors.messages[:scheduled_date]
      ).to contain_exactly(
        I18n.t(
          'activemodel.errors.models.scheduled_to_do.attributes.scheduled_date.not_in_future'
        )
      )
    end
  end

  describe '#save' do
    it 'creates a scheduled to-do' do
      list = create(:list)
      task = 'Buy Christmas presents'
      scheduled_date = 1.week.from_now.to_date

      scheduled_to_do = build(
        :scheduled_to_do,
        list: list,
        task: task,
        scheduled_date: scheduled_date
      )

      expect { scheduled_to_do.save }.to change { ToDo.count }.by(1)

      expect(ToDo.last).to have_attributes(
        list: list,
        task: task,
        scheduled_date: scheduled_date,
        state: 'scheduled'
      )
    end
  end

  describe '#scheduled_date=' do
    it 'converts parseable string to date' do
      date = Date.current

      scheduled_to_do = build(
        :scheduled_to_do,
        scheduled_date: date.strftime('%d-%m-%Y')
      )

      expect(scheduled_to_do.scheduled_date).to eq(date)
    end

    it 'converts non parseable string to nil' do
      scheduled_to_do = build(
        :scheduled_to_do,
        scheduled_date: ''
      )

      expect(scheduled_to_do.scheduled_date).to eq(nil)
    end
  end
end
