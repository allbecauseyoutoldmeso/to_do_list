# frozen_string_literal: true

class ConvertFromScheduledController < ApplicationController
  include ToDoable

  def update
    convert_from_scheduled = ConvertFromScheduled.new(to_do)
    convert_from_scheduled.save
    render(json: to_do_details_json)
  end
end
