# frozen_string_literal: true

class ArchiveDone
  include Presentable

  def save
    subject.to_dos.done.each(&:archived!)
  end
end
