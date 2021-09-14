# frozen_string_literal: true

class ToDosController < ApplicationController
  def index
    @to_dos = ToDo.all
    @new_to_do = ToDo.new
  end

  def create
    to_do = ToDo.new(to_do_params)
    render(json: list_json) if to_do.save
  end

  private

  def to_do_params
    params.require(:to_do).permit(:task)
  end

  def list_json
    {
      list: render_to_string(
        partial: 'list',
        locals: { to_dos: ToDo.all, new_to_do: ToDo.new }
      )
    }
  end
end
