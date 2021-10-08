# frozen_string_literal: true

class ToDo < ApplicationRecord
  EXPIRY_TIME = 1.month

  belongs_to :list

  validates :task, :state, presence: true

  enum state: { to_do: 0, done: 1, archived: 2, priority: 3, scheduled: 4 }

  scope :active, -> { where.not(state: %i[archived scheduled]) }
  scope :persisted, -> { where.not(id: nil) }
  scope :due, -> { scheduled.where(scheduled_date: ..Date.current) }

  scope :expired, lambda {
    where(state: states[:archived], updated_at: ...EXPIRY_TIME.ago)
  }
end
