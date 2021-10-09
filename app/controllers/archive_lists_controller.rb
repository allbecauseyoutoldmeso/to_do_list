# frozen_string_literal: true

class ArchiveListsController < ApplicationController
  include Listable

  def update
    archive_list = ArchiveList.new(list)
    archive_list.save
    render(json: to_dos_json)
  end

  private

  def to_dos_json
    {
      partial: render_to_string(
        partial: 'to_dos/to_dos',
        locals: {
          list: list,
          new_to_do: list.to_dos.new
        }
      )
    }
  end
end
