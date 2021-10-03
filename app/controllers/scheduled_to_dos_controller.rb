# frozen_string_literal: true

class ScheduledToDosController < ApplicationController
  def index
    @list = List.find(params[:list_id])
    @scheduled_to_do = ScheduledToDo.new(list: @list)
  end

  def create
    scheduled_to_do = ScheduledToDo.new(scheduled_to_do_attributes)

    new_scheduled_to_do = if scheduled_to_do.save
                            ScheduledToDo.new(list: list)
                          else
                            scheduled_to_do
                          end

    render(json: scheduled_to_dos_json(new_scheduled_to_do))
  end

  private

  def scheduled_to_do_attributes
    scheduled_to_do_params.merge(list: list)
  end

  def scheduled_to_do_params
    params.require(:scheduled_to_do).permit(:task, :scheduled_date)
  end

  def list
    @list ||= List.find(params[:list_id])
  end

  def scheduled_to_dos_json(new_scheduled_to_do)
    {
      partial: render_to_string(
        partial: 'scheduled_to_dos',
        locals: {
          list: list,
          scheduled_to_do: new_scheduled_to_do
        }
      )
    }
  end
end
