# frozen_string_literal: true

require 'rails_helper'

feature 'viewing lists' do
  scenario 'user successfully views lists' do
    name = 'My Awesome List'
    user = create(:user)
    create(:list, user: user, name: name)

    log_in(user)
    click_link(name)

    expect(page).to have_selector('h1', text: name)
  end
end
