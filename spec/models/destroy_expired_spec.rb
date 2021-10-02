# frozen_string_literal: true

require 'rails_helper'

describe DestroyExpired do
  describe '#destroy_lists' do
    it 'deletes expired lists and associated to-dos' do
      list_1 = create(
        :list,
        state: List.states[:archived],
        updated_at: (List::EXPIRY_TIME + 1.day).ago
      )
      to_do_1 = create(
        :to_do,
        list: list_1
      )
      list_2 = create(
        :list,
        state: List.states[:archived],
        updated_at: (List::EXPIRY_TIME - 1.day).ago
      )
      to_do_2 = create(
        :to_do,
        list: list_2
      )
      list_3 = create(
        :list,
        state: List.states[:active],
        updated_at: (List::EXPIRY_TIME + 1.day).ago
      )

      described_class.new.destroy_lists

      expect(List.exists?(list_1.id)).to eq(false)
      expect(List.exists?(list_2.id)).to eq(true)
      expect(List.exists?(list_3.id)).to eq(true)
      expect(ToDo.exists?(to_do_1.id)).to eq(false)
      expect(ToDo.exists?(to_do_2.id)).to eq(true)
    end
  end

  describe '#destroy_to_dos' do
    it 'deletes expired to-dos' do
      to_do_1 = create(
        :to_do,
        state: ToDo.states[:archived],
        updated_at: (ToDo::EXPIRY_TIME + 1.day).ago
      )
      to_do_2 = create(
        :to_do,
        state: ToDo.states[:archived],
        updated_at: (ToDo::EXPIRY_TIME - 1.day).ago
      )
      to_do_3 = create(
        :to_do,
        state: ToDo.states[:to_do],
        updated_at: (ToDo::EXPIRY_TIME + 1.day).ago
      )

      described_class.new.destroy_to_dos

      expect(ToDo.exists?(to_do_1.id)).to eq(false)
      expect(ToDo.exists?(to_do_2.id)).to eq(true)
      expect(ToDo.exists?(to_do_3.id)).to eq(true)
    end
  end
end
