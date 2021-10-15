# frozen_string_literal: true

require 'rails_helper'

describe ConvertFromScheduled do
  it_behaves_like 'presentable' do
    let(:presenter) { build(:convert_from_scheduled) }

    let(:expected_attributes) do
      { state: 'priority', scheduled_date: nil }
    end
  end
end
