require 'pry-byebug'

module GameOver

  def self.game_over?(board, column, current_row)
    if self.horizontal_check(board) == true
      return true
    elsif self.vertical_check(board, column) == true
      return true
    else if self.diagonal_check(board, column, current_row) == true
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

  def self.diagonal_check(board, column, row)

    bottom_half = false
    top_half = false
    left_side = false
    right_side = false
    middle = false
    if row.between?(3,5) == true
      bottom_half = true
    else
      top_half = true
    end
    if column == 3
      middle = true
    elsif column.between?(0,2)
      left_side = true
    else
      right_side = true
    end
    array_to_check = [[],[]]
    i = 0
    case 
    when bottom_half && left_side
      4.times do 
      array_to_check[0] << board[row - i][column + i]
      i += 1
      end
    when bottom_half && right_side
      4.times do 
      array_to_check[0] << board[row - i][column - i]
      i += 1
      end
    when bottom_half && middle
      4.times do 
      array_to_check[0] << board[row - i][column - i]
      array_to_check[1] << board[row - i][column + i]
      i += 1
      end
    when top_half && middle
      4.times do 
      array_to_check[0] << board[row + i][column - i]
      array_to_check[1] << board[row + i][column + i]
      i += 1 
      end
    when top_half && right_side
      4.times do 
      array_to_check[0] << board[row + i][column - i]
      i += 1
      end
    when top_half && left_side
      4.times do 
      array_to_check[0] << board[row + i][column + i]
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

  # def self.diagonal_check(board, column, current_row)
  #   i = 0
  #   array_to_check = [[],[],[],[]]
  #   if column < 3
  #     4.times do 
  #     binding.pry
  #     if current_row !=
  #     diag_up = board[current_row + i][column + i]
  #     diag_down = board[current_row - i][column + i]
  #     if diag_up != nil
  #       array_to_check[0] << diag_up
  #     end
  #     if diag_down != nil
  #       array_to_check[1] << diag_down
  #     end
  #     i += 1
  #     end
  #   elsif column > 3
  #     4.times do 
  #     binding.pry
  #     array_to_check[0] << board[current_row + i][column - i]
  #     array_to_check[1] << board[current_row - i][column - i]
  #     i += 1
  #     end
  #   else
  #     4.times do
  #     binding.pry
  #     array_to_check[0] << board[current_row + i][column + i]
  #     array_to_check[1] << board[current_row - i][column + i]
  #     array_to_check[2] << board[current_row + i][column - i]
  #     array_to_check[3] << board[current_row - i][column - i]
  #     i += 1
  #     end
  #   end
  #   case array_to_check
  #   in [*,[*, "| \u{1F7E0} |", "| \u{1F7E0} |", "| \u{1F7E0} |", "| \u{1F7E0} |", *],*]
  #     return true
  #   in [*,[*, "| \u{1F7E2} |", "| \u{1F7E2} |", "| \u{1F7E2} |", "| \u{1F7E2} |", *],*]
  #     return true
  #   else
  #     puts ""
  #   end
  # end
end 