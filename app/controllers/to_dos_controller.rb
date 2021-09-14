# frozen_string_literal: true

class ToDosController < ApplicationController
  def index
    @to_dos = ToDo.all
    @new_to_do = ToDo.new
  end

  def create
    to_do = ToDo.new(to_do_params)
    new_to_do = to_do.save ? ToDo.new : to_do
    render(json: list_json(new_to_do))
  end

  private

  def to_do_params
    params.require(:to_do).permit(:task)
  end

  def list_json(new_to_do)
    {
      list: render_to_string(
        partial: 'list',
        locals: { to_dos: ToDo.all, new_to_do: new_to_do }
      )
    }
  end
end
