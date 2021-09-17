# frozen_string_literal: true

module ApplicationHelper
  def to_do_state_options
    ToDo.states.keys.map do |key|
      [I18n.t("to_do.states.#{key}"), key]
    end
  end
end
