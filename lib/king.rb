class King < Piece
  include Stepable
  def render
    color == :black ? "\u265A" : "\u2654"
  end

  def move_dirs
    [
      [1, 0],
      [-1, 0],
      [0, 1],
      [0, -1],
      [1, 1],
      [1, -1],
      [-1, 1],
      [-1, -1]
    ]
  end

end