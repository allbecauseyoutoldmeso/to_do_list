# frozen_string_literal: true

require 'rails_helper'

describe UpdateState do
  it_behaves_like 'presentable' do
    let(:presenter) { build(:update_state, state: ToDo.states[:done]) }

    let(:expected_attributes) do
      { state: 'done' }
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
end
