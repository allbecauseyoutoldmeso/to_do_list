# frozen_string_literal: true

require 'rails_helper'

describe ToDosController, type: :request do
  describe '#create' do
    it 'creates a task' do
      user = create(:user)
      list = create(:list, user: user)

      expect do
        post(
          api_v1_list_to_dos_path(list),
          params: { task: 'Build API' },
          headers: { 'Api-Key' => user.api_key }
        )
      end.to change {
        list.to_dos.count
      }.by(1)

      expect(response.status).to eq(200)

      expect(
        JSON.parse(response.body)['to_do']
      ).to eq(
        list.to_dos.last.api_attributes.deep_stringify_keys
      )
    end
  end
end
