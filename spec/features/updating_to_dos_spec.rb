# frozen_string_literal: true

require 'rails_helper'

feature 'updaing to-dos', js: true do
  scenario 'user updates to-do state to complete' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, list: list, state: ToDo.states[:to_do])

    log_in(user)
    visit(list_to_dos_path(list))

    within("#edit_to_do_#{to_do.id}") do
      select(I18n.t('to_do.states.done'), from: 'to_do_state')
    end

    expect(page).to have_selector('span', text: to_do.task, class: 'done')
  end

  scenario 'user updates to-do state to archived' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, list: list, state: ToDo.states[:to_do])

    log_in(user)
    visit(list_to_dos_path(list))

    within("#edit_to_do_#{to_do.id}") do
      select(I18n.t('to_do.states.archived'), from: 'to_do_state')
    end

    expect(page).not_to have_text(to_do.task)
  end
end
