# frozen_string_literal: true

class ConvertFromScheduledController < ApplicationController
  include ToDoable

  def update
    convert_from_scheduled = ConvertFromScheduled.new(to_do)
    convert_from_scheduled.save
    render(json: to_do_details_json)
  end

  private

  def to_do_details_json
    {
      partial: render_to_string(
        partial: 'to_dos/details',
        locals: {
          list: list,
          to_do: to_do,
          convert_to_scheduled: ConvertToScheduled.new(to_do)
        }
      )
    }
  end
end
