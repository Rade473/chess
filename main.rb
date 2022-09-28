require_relative './lib/board'
require_relative './lib/pieces'
require_relative './lib/render_board'
require_relative './lib/color'
require_relative './lib/player'
require_relative './lib/game'
require_relative './lib/invalid_move_error'

# b = Board.start_chess
# g = Game.new(b, Player.new(:white), Player.new(:black), BoardRendererText)
# puts b.pieces.select{|p| p.color == :black}
# # g.play

b = Board.new

b[[0,0]] = King.new(b, [0, 0], :black)
b[[3,1]] = Rook.new(b, [3, 1], :white)
b[[6,6]] = King.new(b, [6, 6], :white)
b[[3,0]] = Rook.new(b, [3, 0], :white)

render = BoardRendererText.new(b)
render.render

puts b.in_check?(:black)