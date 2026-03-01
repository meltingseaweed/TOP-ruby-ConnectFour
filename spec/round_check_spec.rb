require_relative 'spec_helper'
require_relative '../lib/round_check'
require_relative '../lib/game_systems'
require_relative '../lib/board_display'

describe GameOver do
  subject(:game) { Game.new }
  context 'checks for a connection of 4 from POV of newest token' do
    it 'returns true with an orange horizontal match' do
      game.place_token("o", 3)
      game.place_token("o", 2)
      game.place_token("o", 1)
      game.place_token("o", 0)
      expect(GameOver.game_over?(game.board)).to be true
    end
    
    it 'returns true with a green horizontal match' do
      game.place_token("g", 3)
      game.place_token("g", 5)
      game.place_token("g", 4)
      game.place_token("g", 2)
      expect(GameOver.game_over?(game.board)).to be true
    end

    xit 'returns true with a green vertical match' do
      binding.pry
      game.place_token("g", 2)
      game.place_token("g", 2)
      game.place_token("g", 2)
      game.place_token("g", 2)
      expect(GameOver.game_over?(game.board)).to be true
    end

    xit 'returns true with an orange vertical match' do 
      
    end
  end
end