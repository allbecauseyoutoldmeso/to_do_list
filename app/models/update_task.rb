# frozen_string_literal: true

class UpdateTask
  include Presentable

  delegate_attributes :task

  validates :task, presence: true
end
