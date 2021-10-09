# frozen_string_literal: true

class ArchiveDonesController < ApplicationController
  include Listable

  def update
    archive_done = ArchiveDone.new(list)
    archive_done.save
    render(json: to_dos_json)
  end
end
