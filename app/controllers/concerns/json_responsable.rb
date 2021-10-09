# frozen_string_literal: true

module JsonResponsable
  extend ActiveSupport::Concern

  private

  def to_dos_json(new_to_do = list.to_dos.new)
    {
      partial: render_to_string(
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
      partial: render_to_string(
        partial: 'scheduled_to_dos/scheduled_to_dos',
        locals: {
          list: list,
          scheduled_to_do: scheduled_to_do
        }
      )
    }
  end

  def to_do_details_json(convert_to_scheduled = ConvertToScheduled.new(to_do))
    {
      partial: render_to_string(
        partial: 'to_dos/details',
        locals: {
          list: list,
          to_do: to_do,
          convert_to_scheduled: convert_to_scheduled
        }
      )
    }
  end
end
