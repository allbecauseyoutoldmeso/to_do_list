# frozen_string_literal: true

class ArchiveListsController < ApplicationController
  include Listable

  def update
    archive_list = ArchiveList.new(list)
    archive_list.save
    render(json: to_dos_json)
  end
end
