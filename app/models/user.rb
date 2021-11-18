# frozen_string_literal: true

class User < ApplicationRecord
  has_many :lists, dependent: :destroy

  validates :email, :password, presence: true

  has_secure_password

  has_secure_token :api_key
end
