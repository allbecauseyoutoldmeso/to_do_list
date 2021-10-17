# frozen_string_literal: true

class UpdateScheduledDatesController < ApplicationController
  include ToDoable

  def update
    @update_scheduled_date.attributes = update_scheduled_date_params

    if @update_scheduled_date.save
      @update_scheduled_date = UpdateScheduledDate.new(to_do)
    end

    render(json: { html: render_to_string('to_dos/show', layout: false) })
  end

  private

  def update_scheduled_date_params
    params.require(:update_scheduled_date).permit(:scheduled_date)
  end
end
