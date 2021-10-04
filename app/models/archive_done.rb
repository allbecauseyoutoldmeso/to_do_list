# frozen_string_literal: true

class ArchiveDone
  include Presentable

  def archive_to_dos
    subject.to_dos.done.each(&:archived!)
  end
end
