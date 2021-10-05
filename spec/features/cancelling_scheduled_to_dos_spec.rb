# frozen_string_literal: true

require 'rails_helper'

feature 'cancelling scheduled to-dos', js: true do
  scenario 'user cancels scheduled to-do' do
    user = create(:user)
    list = create(:list, user: user)

    to_do = create(
      :to_do,
      list: list,
      state: ToDo.states[:scheduled],
      scheduled_date: 1.week.from_now
    )

    log_in(user)
    visit(list_scheduled_to_dos_path(list))

    within("#edit_archive_scheduled_#{to_do.id}") do
      click_button(I18n.t('helpers.submit.archive_scheduled.update'))
    end

    expect(page).not_to have_selector('span', text: to_do.task)
  end
end
