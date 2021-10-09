# frozen_string_literal: true

require 'rails_helper'

describe ActivateList do
  describe '#valid?' do
    it 'is true for factory' do
      activate_list = build(:activate_list)
      expect(activate_list.valid?).to eq(true)
    end
  end

  describe '#save' do
    it 'sets list state to active' do
      list = create(:list, state: List.states[:active])
      activate_list = build(:activate_list, list: list)

      activate_list.save

      expect(list.reload.state).to eq('active')
    end
  end
end
