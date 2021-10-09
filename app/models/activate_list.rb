# frozen_string_literal: true

class ActivateList
  include Presentable

  delegate_attributes :state

  before_save :update_state

  private

  def update_state
    self.state = List.states[:active]
  end
end
