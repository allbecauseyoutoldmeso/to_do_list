# frozen_string_literal: true

class ToDosController < ApplicationController
  before_action :assign_list
  before_action :assign_to_do, only: %i[show update]

  def index
    @new_to_do = list.to_dos.new
  end

  def create
    to_do = list.to_dos.new(to_do_params)
    new_to_do = to_do.save ? list.to_dos.new : to_do
    render(json: to_dos_json(new_to_do))
  end

  def update
    to_do.update(to_do_params)
    render(json: to_dos_json(list.to_dos.new))
  end

  private

  attr_reader :list, :to_do

  def assign_list
    @list = current_user.lists.find(params[:list_id])
  end

  def assign_to_do
    @to_do = list.to_dos.find(params[:id])
  end

  def to_do_params
    params.require(:to_do).permit(:task, :state)
  end

  def to_dos_json(new_to_do)
    {
      partial: render_to_string(
        partial: 'to_dos',
        locals: {
          list: list,
          new_to_do: new_to_do
        }
      )
    }
  end
end
