# frozen_string_literal: true

require 'rails_helper'

feature 'updating done to-dos', js: true do
  scenario 'user archives all done to-dos in list' do
    user = create(:user)
    list = create(:list, user: user)
    to_do_1 = create(:to_do, list: list, state: ToDo.states[:to_do])
    to_do_2 = create(:to_do, list: list, state: ToDo.states[:done])

    log_in(user)
    visit(list_to_dos_path(list))
    click_button(I18n.t('to_dos.index.archive_done'))

    expect(page).to have_link(to_do_1.task)
    expect(page).not_to have_link(to_do_2.task)
  end
end
