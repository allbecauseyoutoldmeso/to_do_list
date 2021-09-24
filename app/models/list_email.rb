# frozen_string_literal: true

class ListEmail
  include ActiveModel::Model
  attr_accessor :list_id

  validates :list_id, presence: true

  def deliver_now
    UserMailer.with(list: list).list_email.deliver_now
  end

  private

  def list
    List.find(list_id)
  end
end
