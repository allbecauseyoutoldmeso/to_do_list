# frozen_string_literal: true

class ConvertFromScheduledController < ApplicationController
  include ToDoable

  def update
    @convert_from_scheduled = ConvertFromScheduled.new(to_do)
    @convert_from_scheduled.save
    @convert_to_scheduled = ConvertToScheduled.new(to_do)
    render(json: { html: render_to_string('to_dos/show', layout: false) })
  end
end
