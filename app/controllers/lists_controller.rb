# frozen_string_literal: true

class ListsController < ApplicationController
  include JsonResponsable

  def index
    @lists = current_user.lists.active.persisted
    @new_list = current_user.lists.new
  end

  def archive
    @lists = current_user.lists.archived
  end

  def create
    list = current_user.lists.new(list_params)
    new_list = list.save ? current_user.lists.new : list
    render(json: lists_json(new_list))
  end

  private

  def list_params
    params.require(:list).permit(:name, :state)
  end
end
