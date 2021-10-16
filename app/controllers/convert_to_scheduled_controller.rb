# frozen_string_literal: true

class ConvertToScheduledController < ApplicationController
  include ToDoable

  def update
    @convert_to_scheduled.attributes = convert_to_scheduled_params

    if @convert_to_scheduled.save
      @convert_to_scheduled = ConvertToScheduled.new(to_do)
    end

    render(json: { html: render_to_string('to_dos/show', layout: false) })
  end

  private

  def convert_to_scheduled_params
    params.require(:convert_to_scheduled).permit(:scheduled_date)
  end
end
