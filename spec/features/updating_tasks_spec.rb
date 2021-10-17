# frozen_string_literal: true

require 'rails_helper'

feature 'updating tasks', js: true do
  scenario 'user updates task' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, list: list)
    task = 'New Task'

    log_in(user)
    visit(list_to_do_path(list, to_do))
    click_button(I18n.t('to_dos.show.update_task'))
    fill_in('update_task_task', with: task)
    click_button(I18n.t('helpers.submit.update_task.update'))

    expect(page).to have_selector('h1', text: task)
  end

  scenario 'user submits form without task' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, list: list)

    log_in(user)
    visit(list_to_do_path(list, to_do))
    click_button(I18n.t('to_dos.show.update_task'))
    fill_in('update_task_task', with: '')
    click_button(I18n.t('helpers.submit.update_task.update'))

    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end
end
