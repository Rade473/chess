class Piece
  attr_accessor :board, :color, :location

  def initialize(board, location, color)
    @board = board
    @location = location
    @color = color
  end 

  # available moves that don't put us into check
  def safe_moves
    moves = []
    available_moves.each do |move| 
      new_board = board.dup
      new_board.move_piece!(location, move)
      if !new_board.in_check?(color)
        moves << move
      end
    end
    moves
  end

  def enemy?(location)
    !board[location].nil? && board[location].color != color
  end

  def current_r
    location.first
  end

  def current_c
    location.last
  end
end