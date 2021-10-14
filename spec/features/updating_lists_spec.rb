# frozen_string_literal: true

require 'rails_helper'

feature 'updating lists' do
  scenario 'user successfully archives a list', js: true do
    user = create(:user)
    list_1 = create(:list, user: user)
    list_2 = create(:list, user: user)

    log_in(user)
    visit(root_path)

    within("#edit_archive_list_#{list_1.id}") do
      click_button(I18n.t('helpers.submit.archive_list.update'))
    end

    expect(page).not_to have_selector('li', text: list_1.name)
    expect(page).to have_selector('li', text: list_2.name)
  end

  scenario 'user successfully reactivates a list' do
    user = create(:user)
    list = create(:list, user: user, state: List.states[:archived])

    log_in(user)
    visit(root_path)
    click_link(I18n.t('layouts.nav_bar.archive'))

    within("#edit_activate_list_#{list.id}") do
      click_button(I18n.t('helpers.submit.activate_list.update'))
    end

    expect(page).to have_current_path(lists_path, ignore_query: true)
    expect(page).to have_selector('li', text: list.name)
  end
end
