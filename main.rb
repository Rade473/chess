require_relative './lib/board'
require_relative './lib/pieces'
require_relative './lib/render_board'
require_relative './lib/color'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/invalid_move_error'

def start 
 input = nil
  loop do
    input = gets.chomp
    break if input == '1' || input == 'load' || input == '2'
    puts 'Invalid input'
  end

  b = Board.start_chess
  p b.row_map[:'1']

  g = Game.new(
    b,
    Player.new(:white),
    Player.new(:black),
    BoardRendererText)
  
  g.play

end
start





#  player.rb - gets input change to chess input for moves
#  add save option for game instance
#  add load option
