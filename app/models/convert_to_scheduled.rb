# frozen_string_literal: true

class ConvertToScheduled
  include Presentable

  delegate_attributes :scheduled_date, :state

  before_save :set_state

  validates :scheduled_date, presence: true
  validates_with ScheduledDateValidator

  private

  def set_state
    self.state = ToDo.states[:scheduled]
  end
end
