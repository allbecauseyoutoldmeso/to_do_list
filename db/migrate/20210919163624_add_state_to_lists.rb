# frozen_string_literal: true

class AddStateToLists < ActiveRecord::Migration[6.1]
  def change
    add_column :lists, :state, :integer, default: 0
  end
end
