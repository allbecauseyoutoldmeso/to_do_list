# frozen_string_literal: true

module ApplicationHelper
  def state_options(to_do)
    ToDo.states.except('scheduled').keys.map do |key|
      [
        I18n.t("to_do.states.#{key}"),
        key,
        { disabled: (!to_do.done? && key == 'archived') }
      ]
    end
  end

  def current_user
    @current_user
  end

  def display_date(date)
    date.strftime("#{date.day.ordinalize} of %B %Y")
  end
end
