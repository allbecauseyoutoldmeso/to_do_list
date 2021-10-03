# frozen_string_literal: true

class ActivateDue
  def activate_to_dos
    ToDo.due.each(&:to_do!)
  end
end
