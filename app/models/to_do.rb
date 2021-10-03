# frozen_string_literal: true

class ToDo < ApplicationRecord
  EXPIRY_TIME = 1.month

  belongs_to :list

  validates :task, presence: true
  validates :state, presence: true

  enum state: %i[to_do done archived priority scheduled]

  scope :active, -> { where.not(state: %i[archived scheduled]) }
  scope :persisted, -> { where.not(id: nil) }
  scope :due, -> { scheduled.where(scheduled_date: ..Date.current) }

  scope :expired, lambda {
    where(state: states[:archived], updated_at: ...EXPIRY_TIME.ago)
  }
end
