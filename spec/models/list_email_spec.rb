# frozen_string_literal: true

require 'rails_helper'

describe ListEmail do
  describe '#valid?' do
    it 'is true for factory' do
      list_email = build(:list_email)
      expect(list_email.valid?).to eq(true)
    end

    it 'is false if list_id is not present' do
      list_email = build(:list_email, list_id: nil)
      expect(list_email.valid?).to eq(false)

      expect(
        list_email.errors.messages[:list_id]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end
  end

  describe '#deliver_now' do
    it 'sends list email' do
      list = create(:list)
      list_email = build(:list_email, list_id: list.id)
      list_email.deliver_now
      expect(ActionMailer::Base.deliveries.last.subject).to eq(list.name)
    end
  end
end
