# frozen_string_literal: true

require 'rails_helper'

describe ConvertToScheduled do
  it_behaves_like 'schedulable' do
    let(:presenter) { build(:convert_to_scheduled) }
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
