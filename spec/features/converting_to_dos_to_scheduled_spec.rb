# frozen_string_literal: true

require 'rails_helper'

feature 'converting to-dos to scheduled', js: true do
  scenario 'user updates to-do to scheduled' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, list: list, state: ToDo.states[:to_do])
    scheduled_date = 1.week.from_now

    log_in(user)
    visit(list_to_dos_path(list))
    click_link(to_do.task)

    fill_in(
      'convert_to_scheduled_scheduled_date',
      with: input_date(scheduled_date)
    )

    click_button(I18n.t('helpers.submit.convert_to_scheduled.update'))

    expect(page).to have_selector('th', text: I18n.t('to_do.states.scheduled'))
    expect(page).to have_selector('th', text: display_date(scheduled_date))
  end

  scenario 'user submits form without scheduled date' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, list: list, state: ToDo.states[:to_do])

    log_in(user)
    visit(list_to_do_path(list, to_do))
    click_button(I18n.t('helpers.submit.convert_to_scheduled.update'))

    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end

  scenario 'user submits form with scheduled date in past' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, list: list, state: ToDo.states[:to_do])

    log_in(user)
    visit(list_to_do_path(list, to_do))

    fill_in(
      'convert_to_scheduled_scheduled_date',
      with: input_date(Date.yesterday)
    )

    click_button(I18n.t('helpers.submit.convert_to_scheduled.update'))

    expect(page).to have_content(
      I18n.t(
        'activemodel.errors.models.convert_to_scheduled.attributes.scheduled_date.not_in_future'
      )
    )
  end
end
