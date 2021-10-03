# frozen_string_literal: true

class ScheduledToDo
  include ActiveModel::Model

  attr_accessor :list, :task
  attr_reader :scheduled_date

  validates :task, :scheduled_date, presence: true
  validate :scheduled_date_is_in_future

  def save
    return false unless valid?

    list.to_dos.create(
      task: task,
      scheduled_date: scheduled_date,
      state: ToDo.states[:scheduled]
    )
  end

  def scheduled_date=(value)
    @scheduled_date = value&.to_date
  end

  private

  def scheduled_date_is_in_future
    if scheduled_date.present? && scheduled_date <= Date.current
      errors.add(:scheduled_date, :not_in_future)
    end
  end
end
