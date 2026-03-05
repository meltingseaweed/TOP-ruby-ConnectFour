require_relative '../lib/game_systems'
require_relative 'spec_helper'
require_relative '../lib/board_display'
require 'pry-byebug'

# describe Display do
#   subject(:game) { Game.new }

#   context 'can access the board object' do
#     it 'can access a non-empty board' do
#       game.place_token("green", 3)
#       game.place_token("orange", 3)
#       game.place_token("green", 0)
#       game.place_token("orange", 4)
#       game.place_token("green", 2)
#       Display.board_display(game.board)
#       expect(Display.board_display(game.board)).to eq(game.board)
#     end
#   end
# end