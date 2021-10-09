# frozen_string_literal: true

class ArchiveScheduledController < ApplicationController
  include ToDoable

  def update
    archive_scheduled = ArchiveScheduled.new(to_do)
    archive_scheduled.save
    render(json: scheduled_to_dos_json)
  end
end
