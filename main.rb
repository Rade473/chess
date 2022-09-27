require_relative './lib/board'
require_relative './lib/pieces'
require_relative './lib/render_board'
require_relative './lib/color'

b = Board.start_chess




text_board = BoardRendererText.new(b)
text_board.render

 