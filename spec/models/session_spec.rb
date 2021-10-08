# frozen_string_literal: true

require 'rails_helper'

describe Session do
  describe '#valid?' do
    it 'is true for factory' do
      session = build(:session)
      expect(session.valid?).to eq(true)
    end

    it 'is false if email is not present' do
      session = build(:session, email: nil)
      expect(session.valid?).to eq(false)

      expect(
        session.errors.messages[:email]
      ).to contain_exactly(
        I18n.t('errors.messages.blank')
      )
    end

    it 'is false if password is not present' do
      session = build(:session, password: nil)
      expect(session.valid?).to eq(false)

      expect(
        session.errors.messages[:password]
      ).to include(
        I18n.t('errors.messages.blank')
      )
    end

    it 'is false if no user present' do
      session = build(:session, email: 'unregistered@example.com')

      expect(session.valid?).to eq(false)

      expect(
        session.errors.messages[:base]
      ).to include(
        I18n.t(
          'activemodel.errors.models.session.attributes.base.invalid_credentials'
        )
      )
    end
  end

  describe '#user' do
    it 'returns user matching email and password' do
      user_attributes = {
        email: 'jane.smith@example.com',
        password: 'password'
      }

      user = create(:user, user_attributes)
      session = build(:session, user_attributes)

      expect(session.user).to eq(user)
    end
  end
end
