# frozen_string_literal: true

module Api
  module V1
    class ApplicationController < ActionController::API
      before_action :authenticate_user

      private

      attr_reader :current_user

      def authenticate_user
        @current_user = User.find_by!(api_key: request.headers['Api-Key'])
      end

      rescue_from ActiveRecord::RecordNotFound do |exception|
        render(json: { status: :not_found, error: exception.message })
      end
    end
  end
end
