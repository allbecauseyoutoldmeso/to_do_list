# frozen_string_literal: true

require 'rails_helper'

describe ArchiveList do
  it_behaves_like 'presentable' do
    let(:presenter) { build(:archive_list) }

    let(:expected_attributes) do
      { state: 'archived' }
    end
  end
end
