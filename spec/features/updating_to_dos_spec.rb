# frozen_string_literal: true

require 'rails_helper'

feature 'updaing to-dos', js: true do
  scenario 'user updates to-do state to priority' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, list: list, state: ToDo.states[:to_do])

    log_in(user)
    visit(list_to_dos_path(list))

    within("#edit_update_state_#{to_do.id}") do
      select(I18n.t('to_do.states.priority'), from: 'update_state_state')
    end

    expect(page).to have_link(to_do.task, class: 'priority')
  end

  scenario 'user updates to-do state to archived and then done' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, list: list, state: ToDo.states[:to_do])

    log_in(user)
    visit(list_to_dos_path(list))

    expect(page).not_to have_selector(
      'option',
      text: I18n.t('to_do.states.archived')
    )

    within("#edit_update_state_#{to_do.id}") do
      select(I18n.t('to_do.states.done'), from: 'update_state_state')
    end

    expect(page).to have_link(to_do.task, class: 'done')

    within("#edit_update_state_#{to_do.id}") do
      select(I18n.t('to_do.states.archived'), from: 'update_state_state')
    end

    expect(page).not_to have_text(to_do.task)
  end
end
