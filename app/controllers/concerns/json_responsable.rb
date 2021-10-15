# frozen_string_literal: true

module JsonResponsable
  extend ActiveSupport::Concern

  private

  def to_dos_json(new_to_do = list.to_dos.new)
    {
      html: render_to_string(
        partial: 'to_dos/to_dos',
        locals: {
          list: list,
          new_to_do: new_to_do
        }
      )
    }
  end

  def scheduled_to_dos_json(scheduled_to_do = ScheduledToDo.new(list.to_dos.new))
    {
      html: render_to_string(
        partial: 'scheduled_to_dos/scheduled_to_dos',
        locals: {
          list: list,
          scheduled_to_do: scheduled_to_do
        }
      )
    }
  end

  def lists_json(new_list = current_user.lists.new)
    {
      html: render_to_string(
        partial: 'lists/lists',
        locals: {
          lists: current_user.lists.active.persisted,
          new_list: new_list
        }
      )
    }
  end
end
