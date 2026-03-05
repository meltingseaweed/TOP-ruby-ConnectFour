require 'pry-byebug'
require 'colorize'
require_relative 'board_display'
require_relative 'round_check'
require_relative 'game_systems'

connect_four = Game.new
connect_four.play_connect_four