# frozen_string_literal: true

require 'rails_helper'

describe ActivateList do
  it_behaves_like 'presentable' do
    let(:presenter) { build(:activate_list) }

    let(:expected_attributes) do
      { state: 'active' }
    end
  end
end
