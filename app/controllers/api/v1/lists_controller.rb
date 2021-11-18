# frozen_string_literal: true

module Api
  module V1
    class ListsController < ApplicationController
      def show
        list = current_user.lists.find(params[:id])
        render(json: { status: :ok, list: list.api_attributes })
      end
    end
  end
end
