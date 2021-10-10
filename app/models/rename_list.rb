# frozen_string_literal: true

class RenameList
  include Presentable

  delegate_attributes :name

  validates :name, presence: true
end
