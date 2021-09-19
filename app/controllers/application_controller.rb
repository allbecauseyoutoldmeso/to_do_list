# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user

  private

  def authenticate_user
    redirect_to(new_session_path) unless current_user.present?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:current_user_id])
  end
end
