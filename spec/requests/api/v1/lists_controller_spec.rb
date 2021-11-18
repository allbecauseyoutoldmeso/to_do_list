# frozen_string_literal: true

require 'rails_helper'

describe ListsController, type: :request do
  describe '#show' do
    it 'returns list' do
      user = create(:user)
      list = create(:list, user: user)

      get api_v1_list_path(list), headers: { 'Api-Key' => user.api_key }

      expect(response.status).to eq(200)

      expect(
        JSON.parse(response.body)['list']
      ).to eq(
        list.api_attributes.deep_stringify_keys
      )
    end
  end
end
