class Rook < Piece
  include Slideable
  def render
    color == :black ? "\u265C" : "\u2656"
  end

  def move_dirs
    [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1]
    ]
  end
end