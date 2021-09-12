class ToDo < ApplicationRecord
  validates :task, presence: true
end
