module Slideable
  def available_moves
    moves = []
    move_dirs.each do |(dr, dc)|
      # until we hit a piece we want to add locations to moves
      current_r, current_c = location
      loop do
       current_r += dr
       current_c += dc
       loc = [current_r, current_c]
       break if !board.in_bounds?(loc)
       if board.empty?(loc)
        moves << loc
       end
       if friend?(loc)
        break
       end
       if enemy?(loc)
        moves << loc
        break
       end
      end
    end
  moves
  end
end