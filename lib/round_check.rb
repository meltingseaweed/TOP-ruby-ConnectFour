require 'pry-byebug'

module GameOver

  def self.game_over?(board, row, column)
    if self.horizontal_check(board) == true
      return true
    elsif self.vertical_check(board, column) == true
      return true
    else if self.diagonal_check(board, row, column) == true
      return true
    else 
      return false
    end
    end 
  end


  def self.horizontal_check(board)
    board.each do |row|
      case row
      in [*, "| \u{1F7E0} |", "| \u{1F7E0} |", "| \u{1F7E0} |", "| \u{1F7E0} |", *]
        return true
      in [*, "| \u{1F7E2} |", "| \u{1F7E2} |", "| \u{1F7E2} |", "| \u{1F7E2} |", *]
      return true
      else
        next
      end
    end
  end

  def self.vertical_check(board, column)
    column_values = []
    board.each do |row|
      column_values << row[column]
    end
    case column_values
    in [*, "| \u{1F7E0} |", "| \u{1F7E0} |", "| \u{1F7E0} |", "| \u{1F7E0} |", *]
      return true
    in [*, "| \u{1F7E2} |", "| \u{1F7E2} |", "| \u{1F7E2} |", "| \u{1F7E2} |", *]
      return true
    else
      puts ""
    end
  end

  def self.down_right(board, row, column)
    start = board[row][column]
    i = 1
    array_to_check = []
    until row + i > 5 || column + i > 6 || board[row + i][column + i] != start
      array_to_check << board[row + i][column + i]
      i += 1
    end
    array_to_check
  end

  def self.down_left(board, row, column)
    start = board[row][column]
    i = 0
    array_to_check = []
    until row + i > 5 || column - i < 0 || board[row + i][column - i] != start
      array_to_check << board[row + i][column - i]
      i += 1
    end
    array_to_check
  end

  def self.up_left(board, row, column)
    start = board[row][column]
    i = 0
    array_to_check = []
    until row - i < 0 || column - i < 0 || board[row - i][column - i] != start
      array_to_check << board[row - i][column - i]
      i += 1
    end
    array_to_check
  end

  def self.up_right(board, row, column)
    start = board[row][column]
    i = 1
    array_to_check = []
    until row - i < 0 || column + i > 6 || board[row - i][column + i] != start
      array_to_check << board[row - i][column + i]
      i += 1
    end
    array_to_check
  end

  def self.diagonal_check(board, row, column)
    array_to_check = []
    array_to_check = self.up_left(board, row, column) + self.down_right(board, row, column)
    if array_to_check.length >= 4
      return true
    end
    array_to_check = []
    array_to_check = self.down_left(board, row, column) + self.up_right(board, row, column)
    if array_to_check.length >= 4
      return true
    else
      return false
    end
  end
end 