# frozen_string_literal: true

require 'rails_helper'

feature 'creating lists', js: true do
  scenario 'user successfully creates a list' do
    user = create(:user)
    name = 'My New List'

    log_in(user)
    visit(root_path)
    fill_in('list_name', with: name)
    click_button(I18n.t('helpers.submit.list.create'))

    expect(page).to have_selector('li', text: name)
  end

  scenario 'user submits form without name' do
    user = create(:user)

    log_in(user)
    visit(root_path)
    click_button(I18n.t('helpers.submit.list.create'))

    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end
end
