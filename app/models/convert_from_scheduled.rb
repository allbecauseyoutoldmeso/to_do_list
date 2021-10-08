# frozen_string_literal: true

class ConvertFromScheduled
  include Presentable

  delegate_attributes :scheduled_date, :state

  before_save :set_attributes

  private

  def set_attributes
    self.attributes = {
      state: ToDo.states[:priority],
      scheduled_date: nil
    }
  end
end
