# frozen_string_literal: true

module Helpers
  def log_in(user)
    visit(new_session_path)
    fill_in(I18n.t('simple_form.labels.session.email'), with: user.email)
    fill_in(I18n.t('simple_form.labels.session.password'), with: user.password)
    click_button(I18n.t('helpers.submit.session.create'))
  end
end
