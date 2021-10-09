# frozen_string_literal: true

class ActivateListsController < ApplicationController
  include Listable

  def update
    activate_list = ActivateList.new(list)
    activate_list.save
    redirect_to(lists_path)
  end
end
