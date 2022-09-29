require_relative 'pieces'

# implenets main board features
class Board
  attr_accessor :grid
  attr_reader :row_map, :column_map

  def initialize
    @grid = Array.new(8) { Array.new(8, NullPiece.instance)}
    @row_map = {'1'=> 7, '2'=> 6, '3'=> 5, '4'=> 4, '5'=> 3, '6'=> 2, '7'=> 1, '8'=> 0}
    @column_map = {'a'=> 0, 'b'=> 1, 'c'=> 2, 'd'=> 3, 'e'=> 4, 'f'=> 5, 'g'=> 6, 'h'=> 7}
  end

  def self.start_chess
    board = self.new

    8.times do |c|
      board[[1, c]] = Pawn.new(board, [1, c], :black)
      board[[6, c]] = Pawn.new(board, [6, c], :white)
    end

    board[[0, 0]] = Rook.new(board, [0, 0], :black)
    board[[0, 7]] = Rook.new(board, [0, 7], :black)
    board[[7, 0]] = Rook.new(board, [7, 0], :white)
    board[[7, 7]] = Rook.new(board, [7, 7], :white)

    board[[0, 1]] = Knight.new(board, [0, 1], :black)
    board[[0, 6]] = Knight.new(board, [0, 6], :black)
    board[[7, 1]] = Knight.new(board, [7, 1], :white)
    board[[7, 6]] = Knight.new(board, [7, 6], :white)

    board[[0, 2]] = Bishop.new(board, [0, 2], :black)
    board[[0, 5]] = Bishop.new(board, [0, 5], :black)
    board[[7, 2]] = Bishop.new(board, [7, 2], :white)
    board[[7, 5]] = Bishop.new(board, [7, 5], :white)

    board[[0, 3]] = Queen.new(board, [0, 3], :black)
    board[[7, 3]] = Queen.new(board, [7, 3], :white)

    board[[0, 4]] = King.new(board, [0, 4], :black)
    board[[7, 4]] = King.new(board, [7, 4], :white)

    board
  end

  def []=(location, piece)
    row, column = location
    grid[row][column] = piece
  end

  def [](location)
    row, column = location
    grid[row][column]
  end

  def in_bounds?(location)
    row, column = location

    row < grid.length &&
      column < grid.length &&
      row >= 0 &&
      column >= 0
  end

  def empty?(location)
    row, column = location
    grid[row][column].is_a?(NullPiece)
  end

  def in_check?(color)
    king = pieces.find{ |p| p.color == color && p.is_a?(King) }

    if king.nil?
      raise 'No king found'
    end
    king_pos = king.location
    # loop over all the pieces of the opposite color 
    pieces.select {|p| p.color != color }.each do |piece|
    # and if any piece has in available moves with the position of the king
    #  with color, then color is in check
      if piece.available_moves.include?(king_pos)
        return true
      end
    end
    false
  end

  def checkmate?(color)
    return false if !in_check?(color)
    color_pieces = pieces.select {|p| p.color == color}
    color_pieces.all? {|piece| piece.safe_moves.empty? }
  end

  def pieces
    grid.flatten.reject { |piece| piece.is_a?(NullPiece) }
  end

  def move_piece(start_pos, end_pos)
    # validate that new location is in available moves
    piece = self[start_pos]
    if !piece.safe_moves.include?(end_pos)
      raise InvalidMoveError.new("End position (#{end_pos}) is not in available moves:
      #{piece.safe_moves}")
    end
    if !in_bounds?(end_pos)
      raise InvalidMoveError.new('End position not in bounds')
    end
   move_piece!(start_pos, end_pos)
  end

  def move_piece!(start_pos, end_pos)
     # remove piece from board at current location
    self[start_pos], self[end_pos] = NullPiece.instance, self[start_pos]

     # place piece on the board at new position
     self[end_pos].location = end_pos

  end

  def dup
    new_board = Board.new
    pieces.each do |piece|
      new_piece = piece.class.new(new_board, piece.location, piece.color)
      new_board[new_piece.location] = new_piece
    end
    new_board
  end
end