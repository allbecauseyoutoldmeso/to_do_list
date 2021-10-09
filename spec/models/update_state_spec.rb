# frozen_string_literal: true

require 'rails_helper'

describe UpdateState do
  describe '#valid?' do
    it 'is true for factory' do
      update_state = build(:update_state)
      expect(update_state.valid?).to eq(true)
    end
  end

  describe '#options' do
    it 'returns correct options for to-do that is not done' do
      to_do = build(:to_do, state: ToDo.states[:to_do])
      update_state = build(:update_state, to_do: to_do)

      expect(update_state.options).to contain_exactly(
        [I18n.t('to_do.states.to_do'), 'to_do'],
        [I18n.t('to_do.states.done'), 'done'],
        [I18n.t('to_do.states.priority'), 'priority']
      )
    end

    it 'returns correct options for done to-do' do
      to_do = build(:to_do, state: ToDo.states[:done])
      update_state = build(:update_state, to_do: to_do)

      expect(update_state.options).to contain_exactly(
        [I18n.t('to_do.states.to_do'), 'to_do'],
        [I18n.t('to_do.states.archived'), 'archived'],
        [I18n.t('to_do.states.done'), 'done'],
        [I18n.t('to_do.states.priority'), 'priority']
      )
    end
  end

  describe '#save' do
    it 'updates to-do state' do
      to_do = create(:to_do, state: ToDo.states[:to_do])
      update_state = build(:update_state, to_do: to_do)
      update_state.state = 'done'

      update_state.save

      expect(to_do.reload.state).to eq('done')
    end
  end
end
