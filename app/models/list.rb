# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :user
  has_many :to_dos, -> { order(:created_at) }
  validates :name, presence: true
  enum state: %i[active archived]
  scope :persisted, -> { where.not(id: nil) }
end
