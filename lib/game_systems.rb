require_relative 'board_display'
require 'pry-byebug'
class Game
  include Display
  attr_reader :board

  def initialize
    @board = Array.new(6) { Array.new(7) }
    set_values(@board)
    @row_empty = 0
  end

  def set_values(board)
    board.each.each_with_index do |row, row_idx|
      row.each_with_index do |val, col_idx|
        board[row_idx][col_idx] = "|   |"
      end
    end
  end

  def place_token(player, column)
    row_empty = 0
    if @board[row_empty][column] == "|   |"
      while (@board[row_empty + 1][column] == "|   |") do
          row_empty += 1
          if row_empty == 5 
            break
          end
      end

      @board[row_empty][column] = "|   |" 
      player == "g" ? token = "\u{1F7E2}" : token = "\u{1F7E0}"
      @board[row_empty][column] = "| #{token} |"
      true
    else
      puts "This position is taken, please choose another position"
      false
    end
  end

end