# frozen_string_literal: true

class ListEmailsController < ApplicationController
  def create
    list_email = ListEmail.new(list_email_params)
    list_email.deliver_now
    render(json: list_email_form_json(list_email))
  end

  private

  def list_email_form_json(list_email)
    {
      list_email_form: render_to_string(
        partial: 'list_emails/form',
        locals: {
          list_email: list_email,
          email_sent: true
        }
      )
    }
  end

  def list_email_params
    params.require(:list_email).permit(:list_id)
  end
end
