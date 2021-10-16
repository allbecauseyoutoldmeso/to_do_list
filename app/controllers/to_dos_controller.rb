# frozen_string_literal: true

class ToDosController < ApplicationController
  include ToDoable

  def index
    @new_to_do = list.to_dos.new
  end

  def create
    to_do = list.to_dos.new(to_do_params)

    if to_do.save
      render(json: to_dos_json)
    else
      render(json: to_dos_json(to_do))
    end
  end

  private

  def to_do_params
    params.require(:to_do).permit(:task, :state)
  end
end
