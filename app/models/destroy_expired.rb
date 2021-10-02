# frozen_string_literal: true

class DestroyExpired
  def destroy_lists
    List.expired.destroy_all
  end

  def destroy_to_dos
    ToDo.expired.destroy_all
  end
end
