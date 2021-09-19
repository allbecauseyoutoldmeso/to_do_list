# frozen_string_literal: true

class ListsController < ApplicationController
  def index
    @lists = current_user.lists.active.persisted
    @new_list = current_user.lists.new
  end

  def create
    list = current_user.lists.new(list_params)
    new_list = list.save ? current_user.lists.new : list
    render(json: lists_json(new_list))
  end

  def update
    list = current_user.lists.find(params[:id])
    list.update(list_params)
    render(json: lists_json(current_user.lists.new))
  end

  private

  def list_params
    params.require(:list).permit(:name, :state)
  end

  def lists_json(new_list)
    {
      lists: render_to_string(
        partial: 'lists',
        locals: {
          lists: current_user.lists.active.persisted,
          new_list: new_list
        }
      )
    }
  end
end
