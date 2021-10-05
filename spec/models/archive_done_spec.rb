# frozen_string_literal: true

require 'rails_helper'

describe ArchiveDone do
  describe '#valid?' do
    it 'is true for factory' do
      archive_done = build(:archive_done)
      expect(archive_done.valid?).to eq(true)
    end
  end

  describe '#save' do
    it 'updates to_dos correctly' do
      list = create(:list)
      to_do_1 = create(:to_do, list: list, state: ToDo.states[:to_do])
      to_do_2 = create(:to_do, list: list, state: ToDo.states[:done])
      archive_done = build(:archive_done, list: list)

      archive_done.save

      expect(to_do_1.reload).to be_to_do
      expect(to_do_2.reload).to be_archived
    end
  end
end
