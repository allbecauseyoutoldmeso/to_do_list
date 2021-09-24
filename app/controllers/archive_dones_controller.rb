# frozen_string_literal: true

class ArchiveDonesController < ApplicationController
  def create
    archive_done = ArchiveDone.new(list: list)
    archive_done.archive_to_dos
    render(json: to_dos_json)
  end

  private

  def to_dos_json
    {
      element: render_to_string(
        partial: 'to_dos/to_dos',
        locals: {
          list: list,
          new_to_do: ToDo.new
        }
      )
    }
  end

  def list
    @list ||= List.find(archive_done_params[:list_id])
  end

  def archive_done_params
    params.require(:archive_done).permit(:list_id)
  end
end
