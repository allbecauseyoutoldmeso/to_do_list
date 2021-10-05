# frozen_string_literal: true

class ScheduledDateValidator < ActiveModel::Validator
  def validate(record)
    scheduled_date = record.scheduled_date

    if scheduled_date.present? && scheduled_date <= Date.current
      record.errors.add(:scheduled_date, :not_in_future)
    end
  end
end
