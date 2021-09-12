# frozen_string_literal: true

require 'rails_helper'

feature 'adding a to-do' do
  scenario 'user successfully adds a to-do' do
    task = 'Walk the dog'
    visit(root_path)
    click_link(I18n.t('to_dos.index.new_to_do'))
    fill_in(I18n.t('simple_form.labels.to_do.task'), with: task)
    click_button(I18n.t('helpers.submit.to_do.create'))
    expect(page.current_path).to eq(to_dos_path)
    expect(page).to have_content(task)
  end

  scenario 'user submits form without taks' do
    visit(root_path)
    click_link(I18n.t('to_dos.index.new_to_do'))
    click_button(I18n.t('helpers.submit.to_do.create'))
    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end
end
