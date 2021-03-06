# frozen_string_literal: true

module Listable
  extend ActiveSupport::Concern
  include JsonResponsable

  included do
    before_action :assign_list, only: %i[update show]

    attr_reader :list
  end

  private

  def assign_list
    @list = current_user.lists.find(params[:id])
  end
end
