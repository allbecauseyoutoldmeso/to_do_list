# frozen_string_literal: true

class ArchiveDonesController < ApplicationController
  def update
    archive_done = ArchiveDone.new(list)
    archive_done.save
    render(json: to_dos_json)
  end

  private

  def to_dos_json
    {
      partial: render_to_string(
        partial: 'to_dos/to_dos',
        locals: {
          list: list,
          new_to_do: ToDo.new
        }
      )
    }
  end

  def list
    @list ||= List.find(params[:id])
  end
end
