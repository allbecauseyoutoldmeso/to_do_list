# frozen_string_literal: true

class UpdateStatesController < ApplicationController
  include ToDoable

  def update
    update_state = UpdateState.new(to_do)
    update_state.attributes = update_state_params
    update_state.save
    render(json: to_dos_json)
  end

  private

  def update_state_params
    params.require(:update_state).permit(:state)
  end
end
