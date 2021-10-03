# frozen_string_literal: true

require 'rails_helper'

feature 'creating scheduled to-dos', js: true do
  scenario 'user successfully adds a scheduled to-do' do
    user = create(:user)
    list = create(:list, user: user)
    task = 'Buy milk'
    scheduled_date = 1.week.from_now

    log_in(user)
    visit(list_to_dos_path(list))
    click_link(I18n.t('to_dos.index.scheduled_to_dos'))

    fill_in('scheduled_to_do_task', with: task)

    fill_in(
      'scheduled_to_do_scheduled_date',
      with: scheduled_date.strftime('%d/%m/%Y')
    )

    click_button(I18n.t('helpers.submit.scheduled_to_do.create'))

    expect(page).to have_selector('span', text: task)

    expect(page).to have_selector(
      'span',
      text: scheduled_date.strftime("#{scheduled_date.day.ordinalize} of %B %Y")
    )
  end

  scenario 'user submits empty form' do
    user = create(:user)
    list = create(:list, user: user)

    log_in(user)
    visit(list_scheduled_to_dos_path(list))
    click_button(I18n.t('helpers.submit.scheduled_to_do.create'))

    within('.scheduled_to_do_task') do
      expect(page).to have_content(I18n.t('errors.messages.blank'))
    end

    within('.scheduled_to_do_scheduled_date') do
      expect(page).to have_content(I18n.t('errors.messages.blank'))
    end
  end

  scenario 'user submits form with past date' do
    user = create(:user)
    list = create(:list, user: user)
    task = 'Buy milk'
    scheduled_date = 1.week.ago

    log_in(user)
    visit(list_scheduled_to_dos_path(list))
    fill_in('scheduled_to_do_task', with: task)

    fill_in(
      'scheduled_to_do_scheduled_date',
      with: scheduled_date.strftime('%d/%m/%Y')
    )

    click_button(I18n.t('helpers.submit.scheduled_to_do.create'))

    expect(page).to have_content(
      I18n.t(
        'activemodel.errors.models.scheduled_to_do.attributes.scheduled_date.not_in_future'
      )
    )
  end
end
