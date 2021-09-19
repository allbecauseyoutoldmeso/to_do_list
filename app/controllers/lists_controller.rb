# frozen_string_literal: true

class ListsController < ApplicationController
  def index
    @lists = current_user.lists
  end

  def new
    @list = current_user.lists.new
  end

  def create
    @list = current_user.lists.new(list_params)

    if @list.save
      redirect_to(list_to_dos_path(@list))
    else
      render(:new)
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
