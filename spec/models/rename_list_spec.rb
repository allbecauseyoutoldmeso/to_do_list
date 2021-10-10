# frozen_string_literal: true

require 'rails_helper'

describe RenameList do
  describe '#valid?' do
    it 'is true for factory' do
      rename_list = build(:rename_list)
      expect(rename_list.valid?).to eq(true)
    end

    it 'is false if name is not present' do
      rename_list = build(:rename_list, name: nil)
      expect(rename_list.valid?).to eq(false)

      expect(
        rename_list.errors.messages[:name]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end
  end

  describe '#save' do
    it 'updates list name' do
      name = 'New Name'
      list = create(:list)
      rename_list = build(:rename_list, list: list, name: name)

      rename_list.save

      expect(list.reload.name).to eq(name)
    end
  end
end
