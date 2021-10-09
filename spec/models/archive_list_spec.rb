# frozen_string_literal: true

require 'rails_helper'

describe ArchiveList do
  describe '#valid?' do
    it 'is true for factory' do
      archive_list = build(:archive_list)
      expect(archive_list.valid?).to eq(true)
    end
  end

  describe '#save' do
    it 'sets list state to archived' do
      list = create(:list, state: List.states[:active])
      archive_list = build(:archive_list, list: list)

      archive_list.save

      expect(list.reload.state).to eq('archived')
    end
  end
end
