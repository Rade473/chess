require_relative './lib/board'
require_relative './lib/pieces'
require_relative './lib/render_board'
require_relative './lib/color'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/invalid_move_error'

b = Board.start_chess
g = Game.new(b, Player.new(:white), Player.new(:black), BoardRendererText)
g.play