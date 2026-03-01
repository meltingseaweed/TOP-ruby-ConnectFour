
require 'pry-byebug'
class Game
  # Note, might need to change the symbol or spacing size.
  # As, when tokens are added, the lines around get unaligned.
  # Need further testing to see what works best.
  attr_reader :board, :current_col

  def initialize
    @board = Array.new(6) { Array.new(7) }
    set_values(@board)
    @token = "\u{1F7E2}"
    @token_color = ""
    @current_row = 5
    @current_col = 0
  end

  def set_values(board)
    board.each.each_with_index do |row, row_idx|
      row.each_with_index do |val, col_idx|
        board[row_idx][col_idx] = "|    |"
      end
    end
  end

  def place_token(player, column)
    row_empty = 0
    if @board[row_empty][column] == "|    |"
      while (@board[row_empty + 1][column] == "|    |") do
          row_empty += 1
          if row_empty == 5 
            break
          end
      end
      
      player == "g" ? @token = "\u{1F7E2}" : @token = "\u{1F7E0}"
      @board[row_empty][column] = "| #{@token} |"
      @current_row = row_empty
      @current_col = column
      true
    else
      puts "This position is taken, please choose another position"
      false
    end
  end

end