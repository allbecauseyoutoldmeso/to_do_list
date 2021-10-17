# frozen_string_literal: true

require 'rails_helper'

describe UpdateScheduledDate do
  it_behaves_like 'presentable' do
    let(:expected_attributes) do
      { scheduled_date: 1.week.from_now.to_date }
    end

    let(:presenter) { build(:update_scheduled_date, expected_attributes) }
  end

  it_behaves_like 'future_validator' do
    let(:record) { build(:update_scheduled_date) }
    let(:attribute) { :scheduled_date }
  end

  describe '#valid?' do
    it 'is false if scheduled_date is not present' do
      update_scheduled_date = build(:update_scheduled_date, scheduled_date: nil)
      expect(update_scheduled_date.valid?).to eq(false)

      expect(
        update_scheduled_date.errors.messages[:scheduled_date]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end
  end
end
