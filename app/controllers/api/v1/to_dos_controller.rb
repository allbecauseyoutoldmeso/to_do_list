# frozen_string_literal: true

module Api
  module V1
    class ToDosController < ApplicationController
      def create
        list = current_user.lists.find(params[:list_id])
        to_do = list.to_dos.create(to_do_params)
        render(json: { status: :ok, to_do: to_do.api_attributes })
      end

      private

      def to_do_params
        params.permit(:task)
      end
    end
  end
end
