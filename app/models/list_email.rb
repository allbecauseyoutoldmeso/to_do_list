# frozen_string_literal: true

class ListEmail
  include ActiveModel::Model
  attr_accessor :list

  validates :list, presence: true

  def deliver_now
    UserMailer.with(list: list).list_email.deliver_now
  end
end
