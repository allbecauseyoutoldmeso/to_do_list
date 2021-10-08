# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  describe '#list_email' do
    it 'sets subject as list task' do
      list = create(:list)
      list_email = described_class.with(list: list).list_email

      expect(list_email.subject).to eq(list.name)
    end

    it 'sets to as user email' do
      user = create(:user)
      list = create(:list, user: user)
      list_email = described_class.with(list: list).list_email

      expect(list_email.to).to contain_exactly(user.email)
    end

    it 'includes list name as title' do
      list = create(:list)
      list_email = described_class.with(list: list).list_email

      expect(list_email.body.encoded).to include("<h1>#{list.name}</h1>")
    end

    it 'includes to_do tasks as items' do
      list = create(:list)
      create(:to_do, list: list)
      create(:to_do, list: list)
      list_email = described_class.with(list: list).list_email
      email_body = list_email.body.encoded

      list.to_dos.each do |to_do|
        expect(email_body).to include("<li>#{to_do.task}</li>")
      end
    end
  end
end
