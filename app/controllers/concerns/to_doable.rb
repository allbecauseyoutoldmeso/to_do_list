# frozen_string_literal: true

module ToDoable
  extend ActiveSupport::Concern
  include JsonResponsable

  included do
    before_action :assign_list
    before_action :assign_to_do, only: %i[show update]
    before_action :assign_update_scheduled_date, only: %i[show update]
    before_action :assign_update_task, only: %i[show update]
    before_action :assign_convert_to_scheduled, only: %i[show update]

    attr_reader :list, :to_do
  end

  private

  def assign_list
    @list = current_user.lists.find(params[:list_id])
  end

  def assign_to_do
    @to_do = list.to_dos.find(params[:id])
  end

  def assign_update_task
    @update_task = UpdateTask.new(to_do)
  end

  def assign_convert_to_scheduled
    @convert_to_scheduled = ConvertToScheduled.new(to_do)
  end

  def assign_update_scheduled_date
    @update_scheduled_date = UpdateScheduledDate.new(to_do)
  end
end
