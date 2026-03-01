require 'pry-byebug'
module GameOver
  
  def self.game_over?(board)
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

    # Check vertical
    # Can place all vertical values into and array then check sequence like above?
    column_values = []
    current_col = board.current_col
    p "current column is #{current_col}"
  end

  # def horizontal_check(board)
    
  # end
end
