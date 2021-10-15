# frozen_string_literal: true

require 'rails_helper'

shared_examples_for 'presentable' do
  describe '#valid?' do
    it 'has valid factory' do
      expect(presenter.valid?).to eq(true)
    end
  end

  describe '#save' do
    it 'updates subject attributes' do
      presenter.save

      expect(presenter.subject.reload).to have_attributes(expected_attributes)
    end
  end
end
