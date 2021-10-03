# frozen_string_literal: true

require 'rails_helper'

describe ActivateDue do
  describe '#activate_to_dos' do
    it 'updates due to-dos from scheduled to to-do' do
      to_do_1 = create(
        :to_do,
        state: ToDo.states[:scheduled],
        scheduled_date: 1.day.ago
      )
      to_do_2 = create(
        :to_do,
        state: ToDo.states[:scheduled],
        scheduled_date: 1.day.from_now
      )

      described_class.new.activate_to_dos

      expect(to_do_1.reload.state).to eq('to_do')
      expect(to_do_2.reload.state).to eq('scheduled')
    end
  end
end
