# frozen_string_literal: true

class ListEmailsController < ApplicationController
  def create
    list_email = ListEmail.new(list: list)
    list_email.deliver_now
    render(json: list_email_form_json)
  end

  private

  def list_email_form_json
    {
      element: render_to_string(
        partial: 'list_emails/new',
        locals: {
          list: list,
          email_sent: true
        }
      )
    }
  end

  def list
    @list ||= List.find(list_email_params[:list_id])
  end

  def list_email_params
    params.require(:list_email).permit(:list_id)
  end
end
