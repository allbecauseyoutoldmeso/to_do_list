# frozen_string_literal: true

require 'rails_helper'

feature 'converting to-dos from scheduled', js: true do
  scenario 'user updates to-do to scheduled' do
    user = create(:user)
    list = create(:list, user: user)
    to_do = create(:to_do, :scheduled, list: list)

    log_in(user)
    visit(list_scheduled_to_dos_path(list))
    click_link(to_do.task)
    click_button(I18n.t('helpers.submit.convert_from_scheduled.update'))

    expect(page).to have_content(I18n.t('to_do.states.priority'))
  end
end
