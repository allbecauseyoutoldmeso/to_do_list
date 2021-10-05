# frozen_string_literal: true

require 'rails_helper'

describe ArchiveScheduled do
  describe '#valid?' do
    it 'is true for factory' do
      archive_scheduled = build(:archive_scheduled)
      expect(archive_scheduled.valid?).to eq(true)
    end
  end

  describe '#save' do
    it 'updates state to archived and scheduled_date to nil' do
      to_do = build(
        :to_do,
        scheduled_date: 1.week.from_now,
        state: ToDo.states[:scheduled]
      )
      archive_scheduled = build(:archive_scheduled, to_do: to_do)

      archive_scheduled.save

      expect(to_do).to have_attributes(
        state: 'archived',
        scheduled_date: nil
      )
    end
  end
end
