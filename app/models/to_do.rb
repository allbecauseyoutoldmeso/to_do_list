# frozen_string_literal: true

class ToDo < ApplicationRecord
  belongs_to :list
  validates :task, presence: true
  validates :state, presence: true
  enum state: %i[to_do done archived]
  scope :active, -> { where.not(state: :archived) }
end
