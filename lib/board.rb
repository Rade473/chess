require_relative 'pieces'

# implenets main board features
class Board
  attr_accessor :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) { nil }}
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
    grid[row][column].nil?
  end
end