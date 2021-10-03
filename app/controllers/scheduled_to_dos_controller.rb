# frozen_string_literal: true

class ScheduledToDosController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @scheduled_to_do = ScheduledToDo.new(@list.to_dos.new)
  end

  def create
    scheduled_to_do = ScheduledToDo.new(list.to_dos.new)
    scheduled_to_do.attributes = scheduled_to_do_params

    if scheduled_to_do.save
      render(json: scheduled_to_dos_json)
    else
      render(json: scheduled_to_dos_json(scheduled_to_do))
    end
  end

  def update
    to_do = list.to_dos.scheduled.find(params[:id])
    scheduled_to_do = ScheduledToDo.new(to_do)
    scheduled_to_do.attributes = scheduled_to_do_params
    scheduled_to_do.save
    render(json: scheduled_to_dos_json)
  end

  private

  def scheduled_to_do_params
    params.require(:scheduled_to_do).permit(:task, :scheduled_date, :state)
  end

  def list
    @list ||= List.find(params[:list_id])
  end

  def scheduled_to_dos_json(scheduled_to_do = ScheduledToDo.new(list.to_dos.new))
    {
      partial: render_to_string(
        partial: 'scheduled_to_dos',
        locals: {
          list: list,
          scheduled_to_do: scheduled_to_do
        }
      )
    }
  end
end
