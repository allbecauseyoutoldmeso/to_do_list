# frozen_string_literal: true

class ToDo < ApplicationRecord
  belongs_to :list, optional: true
  validates :task, presence: true
  validates :state, presence: true
  enum state: %i[active complete archived]
end
