class Pawn < Piece

  def render
    color == :black ? "\u265F" : "\u2659"
  end

  def forward_dir
    color == :black ? 1 : -1
  end

  def available_moves
    moves = []

    one_forward = [current_r + forward_dir, current_c]
 
    if board.empty?(one_forward)
      moves << one_forward
    end

    two_forward = [current_r + (forward_dir * 2), current_c]
    if starting_pos? && board.empty?(two_forward) && board.empty?(one_forward)
      moves << two_forward
    end
    diag_left = [(current_r + forward_dir), current_c + 1]
  
    diag_right = [current_r + forward_dir, current_c - 1]
    if enemy?(diag_left)
      moves << diag_left
    end
    if enemy?(diag_right)
      moves << diag_right
    end
    moves.select { |m| board.in_bounds?(m) }
  end

  

  def starting_pos?
    color == :black && current_r == 1 || color == :white && current_r == 6
  end
end