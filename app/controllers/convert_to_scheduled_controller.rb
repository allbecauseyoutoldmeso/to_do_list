# frozen_string_literal: true

class ConvertToScheduledController < ApplicationController
  include ToDoable

  def update
    convert_to_scheduled.attributes = convert_to_scheduled_params

    if convert_to_scheduled.save
      render(json: to_do_details_json)
    else
      render(json: to_do_details_json(convert_to_scheduled))
    end
  end

  private

  def convert_to_scheduled_params
    params.require(:convert_to_scheduled).permit(:scheduled_date)
  end

  def convert_to_scheduled
    @convert_to_scheduled ||= ConvertToScheduled.new(to_do)
  end

  def to_do_details_json(convert_to_scheduled = ConvertToScheduled.new(to_do))
    {
      partial: render_to_string(
        partial: 'to_dos/details',
        locals: {
          list: list,
          to_do: to_do,
          convert_to_scheduled: convert_to_scheduled
        }
      )
    }
  end
end
