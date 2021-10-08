# frozen_string_literal: true

require 'rails_helper'

feature 'sessions' do
  scenario 'user logs in and out successfully' do
    user = create(:user)
    visit(root_path)

    expect(page).to have_current_path(new_session_path, ignore_query: true)

    fill_in(I18n.t('simple_form.labels.session.email'), with: user.email)
    fill_in(I18n.t('simple_form.labels.session.password'), with: user.password)
    click_button(I18n.t('helpers.submit.session.create'))

    expect(page).to have_current_path(root_path, ignore_query: true)

    click_button(I18n.t('layouts.nav_bar.log_out'))

    expect(page).to have_current_path(new_session_path, ignore_query: true)
  end

  scenario 'user submits form with no email' do
    user = create(:user)
    visit(new_session_path)
    fill_in(I18n.t('simple_form.labels.session.password'), with: user.password)
    click_button(I18n.t('helpers.submit.session.create'))

    within('.session_email') do
      expect(page).to have_content(I18n.t('errors.messages.blank'))
    end
  end

  scenario 'user submits form with no password' do
    user = create(:user)
    visit(new_session_path)
    fill_in(I18n.t('simple_form.labels.session.email'), with: user.email)
    click_button(I18n.t('helpers.submit.session.create'))

    within('.session_password') do
      expect(page).to have_content(I18n.t('errors.messages.blank'))
    end
  end

  scenario 'user submits form with invalid log in credentials' do
    user = create(:user)
    visit(new_session_path)
    fill_in(I18n.t('simple_form.labels.session.email'), with: user.email)
    fill_in(I18n.t('simple_form.labels.session.password'), with: 'notpassword')
    click_button(I18n.t('helpers.submit.session.create'))

    expect(page).to have_content(
      I18n.t(
        'activemodel.errors.models.session.attributes.base.invalid_credentials'
      )
    )
  end
end
