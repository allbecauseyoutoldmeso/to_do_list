# frozen_string_literal: true

require 'rails_helper'

feature 'creating to-dos', js: true do
  scenario 'user successfully adds to-do' do
    user = create(:user)
    list = create(:list, user: user)
    task = 'Walk the dog'

    log_in(user)
    visit(list_to_dos_path(list))
    fill_in('to_do_task', with: task)
    click_button(I18n.t('helpers.submit.to_do.create'))

    expect(page).to have_selector('li', text: task)
  end

  scenario 'user submits form without task' do
    user = create(:user)
    list = create(:list, user: user)

    log_in(user)
    visit(list_to_dos_path(list))
    click_button(I18n.t('helpers.submit.to_do.create'))

    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end
end
