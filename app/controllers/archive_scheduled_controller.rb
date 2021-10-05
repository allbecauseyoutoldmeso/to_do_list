# frozen_string_literal: true

class ArchiveScheduledController < ApplicationController
  def update
    archive_scheduled.save
    render(json: scheduled_to_dos_json)
  end

  private

  def archive_scheduled
    @archive_scheduled ||= ArchiveScheduled.new(to_do)
  end

  def to_do
    @to_do ||= list.to_dos.scheduled.find(params[:id])
  end

  def list
    @list ||= current_user.lists.find(params[:list_id])
  end

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
