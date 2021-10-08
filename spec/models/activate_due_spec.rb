# frozen_string_literal: true

require 'rails_helper'

describe ActivateDue do
  describe '#activate_to_dos' do
    it 'updates due to-dos correctly' do
      to_do_1 = create(
        :to_do,
        state: ToDo.states[:scheduled],
        scheduled_date: 1.day.ago
      )
      to_do_2 = create(
        :to_do,
        state: ToDo.states[:scheduled],
        scheduled_date: Date.tomorrow
      )

      described_class.new.activate_to_dos

      expect(to_do_1.reload).to have_attributes(
        state: 'priority',
        scheduled_date: nil
      )
      expect(to_do_2.reload).to have_attributes(
        state: 'scheduled',
        scheduled_date: Date.tomorrow
      )
    end
  end
end
