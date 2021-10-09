# frozen_string_literal: true

class ToDosController < ApplicationController
  include ToDoable

  def index
    @new_to_do = list.to_dos.new
  end

  def create
    to_do = list.to_dos.new(to_do_params)
    new_to_do = to_do.save ? list.to_dos.new : to_do
    render(json: to_dos_json(new_to_do))
  end

  def show
    unless to_do.scheduled?
      @convert_to_scheduled = ConvertToScheduled.new(to_do)
    end
  end

  private

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
