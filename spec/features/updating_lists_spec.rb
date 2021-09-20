# frozen_string_literal: true

require 'rails_helper'

feature 'updating lists' do
  scenario 'user successfully archives a list', js: true do
    user = create(:user)
    list = create(:list, user: user)

    log_in(user)
    visit(root_path)

    within("#edit_list_#{list.id}") do
      click_button(I18n.t('helpers.submit.list.update'))
    end

    expect(page).not_to have_selector('li', text: list.name)
  end

  scenario 'user successfully reactivates a list' do
    user = create(:user)
    list = create(:list, user: user, state: List.states[:archived])

    log_in(user)
    visit(root_path)
    click_link(I18n.t('layouts.nav_bar.archive'))

    within("#edit_list_#{list.id}") do
      click_button(I18n.t('lists.archive.reactivate'))
    end

    expect(page.current_path).to eq(lists_path)
    expect(page).to have_selector('li', text: list.name)
  end
end
