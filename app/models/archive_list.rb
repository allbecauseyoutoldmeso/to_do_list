# frozen_string_literal: true

class ArchiveList
  include Presentable

  delegate_attributes :state

  before_save :update_state

  private

  def update_state
    self.state = List.states[:archived]
  end
end
