# frozen_string_literal: true

class UpdateScheduledDate
  include Presentable

  delegate_attributes :scheduled_date

  validates :scheduled_date, presence: true, future: true
end
