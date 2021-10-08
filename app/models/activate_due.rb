# frozen_string_literal: true

class ActivateDue
  def activate_to_dos
    ToDo.due.each do |to_do|
      convert_from_scheduled = ConvertFromScheduled.new(to_do)
      convert_from_scheduled.save
    end
  end
end
