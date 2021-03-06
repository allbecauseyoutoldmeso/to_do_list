# frozen_string_literal: true

module ApplicationHelper
  def display_date(date)
    date.strftime("#{date.day.ordinalize} of %B %Y") if date.present?
  end

  attr_reader :current_user
end
