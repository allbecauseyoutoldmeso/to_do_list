# frozen_string_literal: true

module Presentable
  extend ActiveSupport::Concern
  include ActiveModel::Model
  extend ActiveModel::Callbacks

  included do
    define_model_callbacks :save

    attr_reader :subject

    delegate :id, :persisted?, to: :subject
  end

  def initialize(subject)
    @subject = subject
  end

  def save
    return false unless valid?

    run_callbacks :save do
      subject.save
    end
  end

  class_methods do
    def delegate_attributes(*attributes)
      attributes.each do |attribute|
        delegate(attribute, to: :subject)
        delegate("#{attribute}=", to: :subject)
      end
    end
  end
end
