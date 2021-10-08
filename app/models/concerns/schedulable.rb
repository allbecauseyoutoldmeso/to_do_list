# frozen_string_literal: true

module Schedulable
  extend ActiveSupport::Concern
  include Presentable

  included do
    delegate_attributes :scheduled_date, :state

    before_save :set_state

    validates :scheduled_date, presence: true, future: true
  end

  private

  def set_state
    self.state = ToDo.states[:scheduled]
  end
end
