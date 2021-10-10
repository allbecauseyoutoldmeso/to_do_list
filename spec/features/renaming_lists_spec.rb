# frozen_string_literal: true

require 'rails_helper'

feature 'renaming lists', js: true do
  scenario 'user updates a list' do
    user = create(:user)
    list = create(:list, user: user, name: 'Old Name')
    name = 'New Name'

    log_in(user)
    visit(list_to_dos_path(list))
    click_button(I18n.t('to_dos.index.rename_list'))

    within("#edit_rename_list_#{list.id}") do
      fill_in('rename_list_name', with: name)
      click_button(I18n.t('helpers.submit.rename_list.update'))
    end

    expect(page).to have_selector('h1', text: name)
  end

  scenario 'user submits form without name' do
    user = create(:user)
    list = create(:list, user: user, name: 'Old Name')

    log_in(user)
    visit(list_to_dos_path(list))
    click_button(I18n.t('to_dos.index.rename_list'))

    within("#edit_rename_list_#{list.id}") do
      fill_in('rename_list_name', with: '')
      click_button(I18n.t('helpers.submit.rename_list.update'))
    end

    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end
end
