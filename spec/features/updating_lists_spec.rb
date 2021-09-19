# frozen_string_literal: true

require 'rails_helper'

feature 'updating lists', js: true do
  scenario 'user successfully archives a list' do
    user = create(:user)
    list = create(:list, user: user)

    log_in(user)
    visit(root_path)

    within("#edit_list_#{list.id}") do
      click_button(I18n.t('helpers.submit.list.update'))
    end

    expect(page).not_to have_selector('li', text: list.name)
  end
end
