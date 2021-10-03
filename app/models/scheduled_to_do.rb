# frozen_string_literal: true

class ScheduledToDo
  include ActiveModel::Model
  extend ActiveModel::Callbacks

  define_model_callbacks :save

  delegate(
    :id,
    :persisted?,
    :scheduled_date,
    :scheduled_date=,
    :state,
    :state=,
    :task,
    :task=,
    to: :to_do
  )

  validates :task, :scheduled_date, presence: true
  validate :scheduled_date_is_in_future

  before_save :set_state

  def initialize(to_do)
    @to_do = to_do
  end

  def save
    return false unless valid?

    run_callbacks :save do
      to_do.save
    end
  end

  private

  attr_reader :to_do

  def scheduled_date_is_in_future
    if scheduled_date.present? && scheduled_date <= Date.current
      errors.add(:scheduled_date, :not_in_future)
    end
  end

  def set_state
    self.state = ToDo.states[:scheduled] unless persisted?
  end
end
