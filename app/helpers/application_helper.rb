# frozen_string_literal: true

module ApplicationHelper
  def state_options(to_do)
    ToDo.states.keys.map do |key|
      [
        I18n.t("to_do.states.#{key}"),
        key,
        { disabled: (!to_do.done? && key == 'archived') }
      ]
    end
  end
end
