require_relative 'spec_helper'
require_relative '../lib/round_check'
require_relative '../lib/game_systems'

describe RoundCheck do
  describe '#Takes inputs and alters board' do
    context 'Takes input and sends the new value to update board' do
      subject(:game) {Game.new}
      # How do we link the values from Board to be tested here?
      it 'changes the value at column 3' do
        input = '3'

        game.instance_variable_get(:@board) = "|   |"
        expect(is_empty?).to be true
      end
    end
  end
end