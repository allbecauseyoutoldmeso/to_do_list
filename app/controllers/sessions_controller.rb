# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_user

  def new
    @session = Session.new
  end

  def create
    @session = Session.new
    @session.attributes = session_params

    if @session.valid?
      session[:current_user_id] = @session.user.id
      redirect_to(root_path)
    else
      render(:new)
    end
  end

  def delete
    session[:current_user_id] = nil
    redirect_to(new_session_path)
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
