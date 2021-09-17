# frozen_string_literal: true

class AddStateToToDos < ActiveRecord::Migration[6.1]
  def change
    add_column :to_dos, :state, :integer, default: 0
  end
end
