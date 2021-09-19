# frozen_string_literal: true

require 'rails_helper'

feature 'creating lists' do
  scenario 'user successfully creates a list' do
    user = create(:user)
    name = 'My New List'

    log_in(user)
    click_link(I18n.t('layouts.nav_bar.new_list'))
    fill_in(I18n.t('simple_form.labels.list.name'), with: name)
    click_button(I18n.t('helpers.submit.list.create'))

    expect(page).to have_selector('h1', text: name)
  end

  scenario 'user submits form without name' do
    user = create(:user)

    log_in(user)
    visit(new_list_path)
    click_button(I18n.t('helpers.submit.list.create'))

    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end
end
