# frozen_string_literal: true

class ToDo < ApplicationRecord
  enum state: [:active, :complete, :archived]
  validates :task, presence: true
  validates :state, presence: true
end
