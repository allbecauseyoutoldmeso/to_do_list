# frozen_string_literal: true

class AddScheduledDateToToDos < ActiveRecord::Migration[6.1]
  def change
    add_column :to_dos, :scheduled_date, :date
  end
end
