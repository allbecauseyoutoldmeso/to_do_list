# frozen_string_literal: true

class RenameListsController < ApplicationController
  include Listable

  def update
    rename_list = RenameList.new(list)
    rename_list.attributes = rename_list_params

    if rename_list.save
      render(json: list_name_json)
    else
      render(json: list_name_json(rename_list: rename_list))
    end
  end

  private

  def rename_list_params
    params.require(:rename_list).permit(:name)
  end

  def list_name_json(rename_list: RenameList.new(list))
    {
      partial: render_to_string(
        partial: 'to_dos/list_name',
        locals: {
          list: list.reload,
          rename_list: rename_list
        }
      )
    }
  end
end
