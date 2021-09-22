# frozen_string_literal: true

require 'rails_helper'

feature 'emailing list', js: true do
  scenario 'user sends list email' do
    user = create(:user)
    list = create(:list, user: user)

    log_in(user)
    visit(list_to_dos_path(list))
    click_button(I18n.t('to_dos.index.email_list'))

    expect(page).to have_content(I18n.t('to_dos.index.email_sent'))

    list_email = ActionMailer::Base.deliveries.last

    expect(list_email.to).to contain_exactly(user.email)
    expect(list_email.subject).to eq(list.name)
  end
end
