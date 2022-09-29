require_relative './lib/board'
require_relative './lib/pieces'
require_relative './lib/render_board'
require_relative './lib/color'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/invalid_move_error'
require_relative './lib/serializer'

extend Serializer

def start 
  puts 'Welcome to a classic chess game'
  puts 'You can choose to play a new game or load an exisitng game file '
  puts 'Type 1 for new game and 2 to load'
 input = nil
  loop do
    input = gets.chomp
    break if input == '1' || input == '2'
    puts 'Invalid input'
  end

  if input == '1'
    b = Board.start_chess
    g = Game.new(
    b,
    Player.new(:white),
    Player.new(:black),
    BoardRendererText)
    g.play
  end
  if input == '2'
    load_game.play
  end
end
start


