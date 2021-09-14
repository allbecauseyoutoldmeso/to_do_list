# frozen_string_literal: true

require 'rails_helper'

feature 'adding a to-do', js: true do
  scenario 'user successfully adds a to-do' do
    task = 'Walk the dog'
    visit(root_path)
    fill_in('to_do_task', with: task)
    click_button(I18n.t('helpers.submit.to_do.create'))
    expect(page).to have_selector('li', text: task)
  end

  xscenario 'user submits form without task' do
    visit(root_path)
    click_button(I18n.t('helpers.submit.to_do.create'))
    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end
end
