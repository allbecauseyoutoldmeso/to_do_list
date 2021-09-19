# frozen_string_literal: true

class AddListIdToToDos < ActiveRecord::Migration[6.1]
  def change
    add_reference :to_dos, :list, index: true
  end
end
