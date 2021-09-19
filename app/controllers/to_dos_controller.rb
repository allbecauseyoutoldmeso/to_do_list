# frozen_string_literal: true

class ToDosController < ApplicationController
  before_action :set_list

  def index
    @to_dos = list.to_dos.active
    @new_to_do = list.to_dos.new
  end

  def create
    to_do = list.to_dos.new(to_do_params)
    new_to_do = to_do.save ? list.to_dos.new : to_do
    render(json: list_json(new_to_do))
  end

  def update
    to_do = list.to_dos.find(params[:id])
    to_do.update(to_do_params)
    render(json: list_json(list.to_dos.new))
  end

  private

  attr_reader :list

  def set_list
    @list = List.find_by(id: params[:list_id]) || current_user.primary_list
  end

  def to_do_params
    params.require(:to_do).permit(:task, :state)
  end

  def list_json(new_to_do)
    {
      list: render_to_string(
        partial: 'list',
        locals: {
          to_dos: list.to_dos.active,
          new_to_do: new_to_do
        }
      )
    }
  end
end
