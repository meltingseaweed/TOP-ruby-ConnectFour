

module Display

  def self.board_display(board)
    board.each_with_index do |row, row_idx|
      row.each_with_index do |place, column_index|
        print place
        end
      puts ""
    end
  end

end

  # Unicode
  # Green Circle: puts "\u{1F7E2}" 
  # Orange Circle: puts "\u{1F7E0}"
