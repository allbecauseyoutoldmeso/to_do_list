# frozen_string_literal: true

require 'rails_helper'

describe ListEmail do
  describe '#valid?' do
    it 'is true for factory' do
      list_email = build(:list_email)
      expect(list_email.valid?).to eq(true)
    end
  end

  describe '#deliver_now' do
    it 'sends list email' do
      list = create(:list)
      list_email = build(:list_email, list: list)
      list_email.deliver_now
      expect(ActionMailer::Base.deliveries.last.subject).to eq(list.name)
    end
  end
end
