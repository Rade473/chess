class Piece
  attr_accessor :board, :color, :location

  def initialize(board, location, color)
    @board = board
    @location = location
    @color = color
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