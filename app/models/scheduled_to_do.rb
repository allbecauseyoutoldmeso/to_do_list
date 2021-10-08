# frozen_string_literal: true

class ScheduledToDo
  include Schedulable

  delegate_attributes :task

  validates :task, presence: true
end
