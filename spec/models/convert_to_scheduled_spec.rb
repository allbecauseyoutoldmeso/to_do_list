# frozen_string_literal: true

require 'rails_helper'

describe ConvertToScheduled do
  describe '#valid?' do
    it 'is true for factory' do
      convert_to_scheduled = build(:convert_to_scheduled)
      expect(convert_to_scheduled.valid?).to eq(true)
    end

    it 'is false if scheduled_date is not present' do
      convert_to_scheduled = build(:convert_to_scheduled, scheduled_date: nil)
      expect(convert_to_scheduled.valid?).to eq(false)

      expect(
        convert_to_scheduled.errors.messages[:scheduled_date]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end

    it 'is false if scheduled_date is not in future' do
      convert_to_scheduled = build(
        :convert_to_scheduled,
        scheduled_date: 1.day.ago
      )

      expect(convert_to_scheduled.valid?).to eq(false)

      expect(
        convert_to_scheduled.errors.messages[:scheduled_date]
      ).to contain_exactly(
        I18n.t(
          'activemodel.errors.models.convert_to_scheduled.attributes.scheduled_date.not_in_future'
        )
      )
    end
  end

  describe '#save' do
    it 'updates to-do correctly' do
      to_do = create(:to_do, scheduled_date: nil, state: ToDo.states[:to_do])
      scheduled_date = 1.week.from_now.to_date
      convert_to_scheduled = build(
        :convert_to_scheduled,
        to_do: to_do,
        scheduled_date: scheduled_date
      )

      convert_to_scheduled.save

      expect(convert_to_scheduled).to have_attributes(
        scheduled_date: scheduled_date,
        state: 'scheduled'
      )
    end
  end
end
