# frozen_string_literal: true

class ScheduledToDo
  include Presentable

  delegate_attributes :scheduled_date, :state, :task

  before_save :set_state

  validates :task, :scheduled_date, presence: true
  validate :scheduled_date_is_in_future

  private

  def scheduled_date_is_in_future
    if scheduled_date.present? && scheduled_date <= Date.current
      errors.add(:scheduled_date, :not_in_future)
    end
  end

  def set_state
    self.state = ToDo.states[:scheduled] unless persisted?
  end
end
