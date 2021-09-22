# frozen_string_literal: true

class UserMailer < ApplicationMailer
  def list_email
    @list = params[:list]
    mail(to: @list.user.email, subject: @list.name)
  end
end
