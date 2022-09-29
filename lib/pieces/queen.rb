class Queen < Piece
  include Slideable
  def render
    color == :black ? "\u265B" : "\u2655"
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