# frozen_string_literal: true

class UpdateTasksController < ApplicationController
  include ToDoable

  def update
    @update_task.attributes = update_task_params

    if @update_task.save
      @update_task = UpdateTask.new(to_do)
    else
      @to_do.reload
    end

    render(json: { html: render_to_string('to_dos/show', layout: false) })
  end

  private

  def update_task_params
    params.require(:update_task).permit(:task)
  end
end
