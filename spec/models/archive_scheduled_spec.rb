# frozen_string_literal: true

require 'rails_helper'

describe ArchiveScheduled do
  it_behaves_like 'presentable' do
    let(:presenter) { build(:archive_scheduled) }

    let(:expected_attributes) do
      { state: 'archived', scheduled_date: nil }
    end
  end
end
