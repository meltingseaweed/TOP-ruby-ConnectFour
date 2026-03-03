require_relative 'spec_helper'
require_relative '../lib/round_check'
require_relative '../lib/game_systems'
require_relative '../lib/board_display'

describe GameOver do
  subject(:game) { Game.new }
  context 'checks for a connection of 4 from POV of newest token' do
    it 'returns false with no match of four' do
      game.place_token("o", 3)
      game.place_token("o", 2)
      game.place_token("g", 1)
      game.place_token("o", 0)
      expect(GameOver.game_over?(game.board, 0, 0)).to be false
    end
    it 'returns true with an orange horizontal match' do
      game.place_token("o", 3)
      game.place_token("o", 2)
      game.place_token("o", 1)
      game.place_token("o", 0)
      expect(GameOver.game_over?(game.board, 0, 0)).to be true
    end
    
    it 'returns true with a green horizontal match' do
      game.place_token("g", 3)
      game.place_token("g", 5)
      game.place_token("g", 4)
      game.place_token("g", 2)
      expect(GameOver.game_over?(game.board, 2, 0)).to be true
    end

    it 'returns true with a green vertical match' do
      game.place_token("g", 2)
      game.place_token("g", 2)
      game.place_token("g", 2)
      game.place_token("g", 2)
      expect(GameOver.game_over?(game.board, 2, 3)).to be true
    end

    it 'returns true with an orange vertical match' do 
      game.place_token("o", 4)
      game.place_token("o", 4)
      game.place_token("o", 4)
      game.place_token("o", 4)
      expect(GameOver.game_over?(game.board, 4, 3)).to be true
    end

    it 'returns true with an orange diagonal match' do 
      game.board[0][3] = "| \u{1F7E0} |"
      game.board[1][4] = "| \u{1F7E0} |"
      game.board[2][5] = "| \u{1F7E0} |"
      game.board[3][6] = "| \u{1F7E0} |"
      Display.board_display(game.board)
      expect(GameOver.game_over?(game.board, 3, 0)).to be true
    end
    # We will add row input as well I believe
    it 'returns true with a green diagonal match' do 
      game.board[5][1] = "| \u{1F7E2} |"
      game.board[4][2] = "| \u{1F7E2} |"
      game.board[3][3] = "| \u{1F7E2} |"
      game.board[2][4] = "| \u{1F7E2} |"
      Display.board_display(game.board)
      expect(GameOver.game_over?(game.board, 4, 2)).to be true
    end
  end
end