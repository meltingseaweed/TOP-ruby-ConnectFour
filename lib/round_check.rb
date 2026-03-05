require 'pry-byebug'

module GameOver

  def self.game_over?(board, column, current_row)
    if self.horizontal_check(board) == true
      return true
    elsif self.vertical_check(board, column) == true
      return true
    else if current_row < 3 && self.diagonal_check(board, column, current_row) == true
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

  def self.diagonal_check(board, column, current_row)
    i = 0
    array_to_check = [[],[],[],[]]
    if column < 3
      4.times do 
      array_to_check[0] << board[current_row + i][column + i]
      array_to_check[1] << board[current_row - i][column + i]
      i += 1
      end
    elsif column > 3
      4.times do 
      array_to_check[0] << board[current_row + i][column - i]
      array_to_check[1] << board[current_row - i][column - i]
      i += 1
      end
    else
      4.times do 
      array_to_check[0] << board[current_row + i][column + i]
      array_to_check[1] << board[current_row - i][column + i]
      array_to_check[2] << board[current_row + i][column - i]
      array_to_check[3] << board[current_row - i][column - i]
      i += 1
      end
    end
    case array_to_check
    in [*,[*, "| \u{1F7E0} |", "| \u{1F7E0} |", "| \u{1F7E0} |", "| \u{1F7E0} |", *],*]
      return true
    in [*,[*, "| \u{1F7E2} |", "| \u{1F7E2} |", "| \u{1F7E2} |", "| \u{1F7E2} |", *],*]
      return true
    else
      puts ""
    end
  end
end 