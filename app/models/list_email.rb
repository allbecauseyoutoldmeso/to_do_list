# frozen_string_literal: true

class ListEmail
  include ActiveModel::Model

  delegate :id, :persisted?, to: :list

  def initialize(list)
    @list = list
  end

  def deliver_now
    UserMailer.with(list: list).list_email.deliver_now
  end

  private

  attr_reader :list
end
