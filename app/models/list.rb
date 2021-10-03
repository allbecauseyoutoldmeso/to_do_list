# frozen_string_literal: true

class List < ApplicationRecord
  EXPIRY_TIME = 1.month

  belongs_to :user

  has_many :to_dos, -> { order(:created_at) }, dependent: :destroy

  validates :name, presence: true

  enum state: %i[active archived]

  scope :persisted, -> { where.not(id: nil) }

  scope :expired, lambda {
    where(state: states[:archived], updated_at: ...EXPIRY_TIME.ago)
  }

  def scheduled_to_dos
    @scheduled_to_dos ||= to_dos.scheduled.map do |to_do|
      ScheduledToDo.new(to_do)
    end
  end
end
