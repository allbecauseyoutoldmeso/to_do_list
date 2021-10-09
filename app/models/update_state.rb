# frozen_string_literal: true

class UpdateState
  include Presentable

  delegate_attributes :state

  delegate :done?, to: :subject

  def options
    selectable_states.map do |state|
      [
        I18n.t("to_do.states.#{state}"),
        state
      ]
    end
  end

  private

  def selectable_states
    ToDo.states.except(*unselectable_states).keys
  end

  def unselectable_states
    [
      'scheduled',
      ('archived' unless done?)
    ]
  end
end
