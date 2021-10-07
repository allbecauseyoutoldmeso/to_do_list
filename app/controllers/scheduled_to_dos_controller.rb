# frozen_string_literal: true

class ScheduledToDosController < ApplicationController
  before_action :assign_list
  before_action :assign_scheduled_to_do

  def create
    scheduled_to_do.attributes = scheduled_to_do_params

    if scheduled_to_do.save
      render(json: scheduled_to_dos_json)
    else
      render(json: scheduled_to_dos_json(scheduled_to_do))
    end
  end

  private

  attr_reader :list, :scheduled_to_do

  def assign_scheduled_to_do
    @scheduled_to_do = ScheduledToDo.new(@list.to_dos.new)
  end

  def assign_list
    @list = List.find(params[:list_id])
  end

  def scheduled_to_do_params
    params.require(:scheduled_to_do).permit(:task, :scheduled_date, :state)
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
