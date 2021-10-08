# frozen_string_literal: true

require 'rails_helper'

shared_examples_for 'schedulable' do
  describe '#valid?' do
    it 'is true for factory' do
      expect(presenter.valid?).to eq(true)
    end

    it 'is false if scheduled_date is not present' do
      presenter.scheduled_date = nil
      expect(presenter.valid?).to eq(false)

      expect(
        presenter.errors.messages[:scheduled_date]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end

    it_behaves_like 'future_validator' do
      let(:record) { presenter }
      let(:attribute) { :scheduled_date }
    end
  end
end
