# frozen_string_literal: true

class ArchiveScheduledController < ApplicationController
  include ToDoable

  def update
    archive_scheduled = ArchiveScheduled.new(to_do)
    archive_scheduled.save
    render(json: scheduled_to_dos_json)
  end

  private

  def scheduled_to_dos_json
    {
      partial: render_to_string(
        partial: 'scheduled_to_dos/scheduled_to_dos',
        locals: {
          list: list,
          scheduled_to_do: ScheduledToDo.new(list.to_dos.new)
        }
      )
    }
  end
end
