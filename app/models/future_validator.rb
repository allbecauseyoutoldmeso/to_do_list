# frozen_string_literal: true

class FutureValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    if value.present? && value <= Date.current
      record.errors.add(attribute, :not_in_future)
    end
  end
end
