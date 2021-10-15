# frozen_string_literal: true

require 'rails_helper'

describe RenameList do
  it_behaves_like 'presentable' do
    let(:expected_attributes) do
      { name: 'New Name' }
    end

    let(:presenter) { build(:rename_list, expected_attributes) }
  end

  describe '#valid?' do
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
end
