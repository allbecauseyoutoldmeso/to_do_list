# frozen_string_literal: true

class ListEmail
  include Presentable

  def deliver_now
    UserMailer.with(list: subject).list_email.deliver_now
  end
end
