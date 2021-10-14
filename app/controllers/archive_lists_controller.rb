# frozen_string_literal: true

class ArchiveListsController < ApplicationController
  include Listable

  def update
    archive_list = ArchiveList.new(list)
    archive_list.save
    render(json: lists_json)
  end
end
