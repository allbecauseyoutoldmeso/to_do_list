# frozen_string_literal: true

require 'rails_helper'

feature 'updaing to-do state', js: true do
  scenario 'user updates to-do to complete' do
    to_do = create(:to_do, state: ToDo.states[:active])
    visit(root_path)

    within("#edit_to_do_#{to_do.id}") do
      select(I18n.t('to_do.states.complete'), from: 'to_do_state')
    end

    expect(page).to have_selector('span', text: to_do.task, class: 'complete')
  end

  scenario 'user updates to-do to archived' do
    to_do = create(:to_do, state: ToDo.states[:active])
    visit(root_path)

    within("#edit_to_do_#{to_do.id}") do
      select(I18n.t('to_do.states.archived'), from: 'to_do_state')
    end

    expect(page).not_to have_text(to_do.task)
  end
end
