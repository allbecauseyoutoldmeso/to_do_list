# frozen_string_literal: true

class ListEmailsController < ApplicationController
  include Listable

  def update
    list_email = ListEmail.new(list)
    list_email.deliver_now
    render(json: list_email_form_json)
  end

  private

  def list_email_form_json
    {
      html: render_to_string(
        partial: 'list_emails/edit',
        locals: {
          list: list,
          email_sent: true
        }
      )
    }
  end
end
