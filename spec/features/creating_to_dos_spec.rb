# frozen_string_literal: true

require 'rails_helper'

feature 'creating to-dos', js: true do
  scenario 'user successfully adds a to-do' do
    user = create(:user)
    task = 'Walk the dog'

    log_in(user)
    fill_in('to_do_task', with: task)
    click_button(I18n.t('helpers.submit.to_do.create'))
    expect(page).to have_selector('li', text: task)
  end

  scenario 'user submits form without task' do
    user = create(:user)

    log_in(user)
    click_button(I18n.t('helpers.submit.to_do.create'))
    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end
end
