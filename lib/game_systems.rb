require 'pry-byebug'
require 'colorize'
require_relative 'round_check'

class Game

  attr_reader :board, :current_col, :current_row

  def initialize
    @board = Array.new(6) { Array.new(7) }
    set_values(@board)
    @token = "\u{1F7E2}"
    @player = ""
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

  def get_column
    continue = true
    while continue == true
    column = gets.chomp
    if column.match?(/^[0-6]$/)
      continue = false
    else
      puts "Please enter a number from 0 to 6"
    end
    end
    column
  end

  def get_player
    puts "Who goes first, orange or green?"
    player = gets.chomp
    player
  end

  def verify_player
    player_selected = false
    until player_selected == true
      player = get_player
      if player == "orange" || player == "green"
        player_selected = true
      else
        puts "Sorry, please enter 'orange' or 'green'"
      end
    end
    player
  end

  def place_token(player, column)
    row_empty = 0
    column = column.to_i
    if @board[row_empty][column] == "|    |"
      while (@board[row_empty + 1][column] == "|    |") do
        row_empty += 1
        if row_empty == 5
          break
        end
      end
      player == "green" ? @token = "\u{1F7E2}" : @token = "\u{1F7E0}"
      @board[row_empty][column] = "| #{@token} |"
      @current_row = row_empty
      true
    else
      puts "This position is taken, please choose another column"
      false
    end
  end

  def play_connect_four
    game_over = false
    @player = verify_player
    until game_over == true
    Display.board_display(@board)
    puts "place your token by choosing a column number"
    puts "#{@player} is next, where will you place your next token?"
    @current_col = get_column.to_i
    place_token(@player, @current_col)
    game_over = GameOver.game_over?(@board, @current_row, @current_col)
    if game_over == false
      @player == "orange" ? @player = "green" : @player = "orange"  
    end
    end
    Display.board_display(@board)
    puts "Congratulations, #{@player} is the winner!".colorize(:cyan)
  end
end