# frozen_string_literal: true

require 'rails_helper'

feature 'updating scheduled_dates', js: true do
  scenario 'user updates scheduled_date' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(
      :to_do,
      :scheduled,
      list: list,
      scheduled_date: 2.days.from_now
    )
    scheduled_date = 3.days.from_now.to_date

    log_in(user)
    visit(list_to_do_path(list, to_do))
    click_button(I18n.t('to_dos.show.update_scheduled_date'))
    fill_in(
      'update_scheduled_date_scheduled_date',
      with: input_date(scheduled_date)
    )
    click_button(I18n.t('helpers.submit.update_scheduled_date.update'))

    expect(page).to have_content(display_date(scheduled_date))
  end

  scenario 'user submits form without scheduled_date' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, :scheduled, list: list)

    log_in(user)
    visit(list_to_do_path(list, to_do))
    click_button(I18n.t('to_dos.show.update_scheduled_date'))
    fill_in('update_scheduled_date_scheduled_date', with: '')
    click_button(I18n.t('helpers.submit.update_scheduled_date.update'))

    expect(page).to have_content(I18n.t('errors.messages.blank'))
  end

  scenario 'user submits form without scheduled_date in past' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, :scheduled, list: list)
    scheduled_date = 1.week.ago.to_date

    log_in(user)
    visit(list_to_do_path(list, to_do))
    click_button(I18n.t('to_dos.show.update_scheduled_date'))
    fill_in(
      'update_scheduled_date_scheduled_date',
      with: input_date(scheduled_date)
    )
    click_button(I18n.t('helpers.submit.update_scheduled_date.update'))

    expect(page).to have_content(
      I18n.t(
        'activemodel.errors.models.update_scheduled_date.attributes.scheduled_date.not_in_future'
      )
    )
  end
end
