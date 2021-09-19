# frozen_string_literal: true

class User < ApplicationRecord
  has_many :lists
  validates :email, presence: true
  validates :password, presence: true
  has_secure_password

  def primary_list
    lists.find_by(primary: true)
  end
end
