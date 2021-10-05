# frozen_string_literal: true

class ScheduledToDo
  include Presentable

  delegate_attributes :scheduled_date, :state, :task

  before_save :set_state

  validates :task, :scheduled_date, presence: true
  validates_with ScheduledDateValidator

  private

  def set_state
    self.state = ToDo.states[:scheduled]
  end
end
