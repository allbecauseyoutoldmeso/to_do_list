# frozen_string_literal: true

require 'rails_helper'

describe ConvertFromScheduled do
  describe '#valid?' do
    it 'is true for factory' do
      convert_from_scheduled = build(:convert_from_scheduled)
      expect(convert_from_scheduled.valid?).to eq(true)
    end
  end

  describe '#save' do
    it 'updates to-do correctly' do
      to_do = create(:to_do, :scheduled)
      convert_from_scheduled = build(:convert_from_scheduled, to_do: to_do)

      convert_from_scheduled.save

      expect(to_do.reload).to have_attributes(
        state: 'priority',
        scheduled_date: nil
      )
    end
  end
end
