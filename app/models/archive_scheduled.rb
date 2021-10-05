# frozen_string_literal: true

class ArchiveScheduled
  include Presentable

  delegate_attributes :state, :scheduled_date

  before_save :set_attributes

  private

  def set_attributes
    self.attributes = {
      state: ToDo.states[:archived],
      scheduled_date: nil
    }
  end
end
