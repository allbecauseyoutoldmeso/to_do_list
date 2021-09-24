# frozen_string_literal: true

class ArchiveDone
  include ActiveModel::Model
  attr_accessor :list

  validates :list, presence: true

  def archive_to_dos
    if valid?
      list.to_dos.done.each(&:archived!)
    end
  end
end
