# frozen_string_literal: true

class ConvertFromScheduledController < ApplicationController
  include ToDoable

  def update
    @convert_from_scheduled = ConvertFromScheduled.new(to_do)
    @convert_from_scheduled.save
    render(json: { html: render_to_string('to_dos/show', layout: false) })
  end
end
