# frozen_string_literal: true

class ToDo < ApplicationRecord
  validates :task, presence: true
end
