# frozen_string_literal: true

class ArchiveDone
  include ActiveModel::Model

  delegate :id, :persisted?, to: :list

  def initialize(list)
    @list = list
  end

  def archive_to_dos
    list.to_dos.done.each(&:archived!)
  end

  private

  attr_reader :list
end
