# frozen_string_literal: true

class UserPreview < ActionMailer::Preview
  def list_email
    UserMailer.with(list: List.first).list_email
  end
end
