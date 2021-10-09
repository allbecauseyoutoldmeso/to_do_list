# frozen_string_literal: true

module ToDoable
  extend ActiveSupport::Concern
  include JsonResponsable

  included do
    before_action :assign_list
    before_action :assign_to_do, only: %i[show update]

    attr_reader :list, :to_do
  end

  private

  def assign_list
    @list = current_user.lists.find(params[:list_id])
  end

  def assign_to_do
    @to_do = list.to_dos.find(params[:id])
  end
end
