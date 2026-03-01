require_relative '../lib/game_systems'
require_relative 'spec_helper'
require 'pry-byebug'
describe Game do
  subject(:game) { Game.new }
  describe '#initialize' do
    context 'Can initialize the 6x7 nested array board' do
      it 'First value is "|    |"' do
        expect(game.board[0][0]).to eql("|    |")
      end

      it 'Last value is "|    |"' do
        expect(game.board[5][6]).to eql("|    |")
      end

      it 'All values are "|    |"' do 
        count = 0
        game.board.each_with_index do |row, row_idx|
          row.each_with_index do |val, col_idx|
            if val == "|    |"
              count += 1
            end
          end
        end
        expect(count).to eql(42)
      end
    end
  end

  describe '#place token' do
    context 'places the token in the correct place' do

     it 'changes the value in the third column to green' do
     game.place_token("g", 2)
     expect(game.board[5][2]).to eq("| \u{1F7E2} |")
     end

     it 'changes the value in the fifth column to orange' do
       game.place_token("o", 5)
       expect(game.board[5][5]).to eq("| \u{1F7E0} |")
     end

     it 'places an orange token in the next open space' do
       game.board[5][2] = "| \u{1F7E0} |"
       game.place_token("o", 2)
       expect(game.board[4][2]).to eq("| \u{1F7E0} |")
     end

     it 'places a green token in the next open space' do
       game.board[2][5] = "| \u{1F7E0} |"
       game.place_token("g", 5)
       expect(game.board[1][5]).to eq("| \u{1F7E2} |")
     end

     it 'does not place anything if top row is filled' do
       game.board[0][5] = "| \u{1F7E0} |"
       expect(game.place_token("g", 5)).to be false
     end
    end
  end
end