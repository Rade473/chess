require_relative 'serializer'

class Game
  attr_reader :player1, :player2, :board, :renderer
  attr_accessor :current_player

  include Serializer

  def initialize(board, player1, player2, renderer_class)
    @board = board
    @renderer = renderer_class.new(board)
    @player1 = player1
    @player2 = player2
    @current_player = @player1
  end

  def play
    while !over?
      puts "\e[H\e[2J"
      renderer.render
      puts "It's #{current_player.color}'s turn"
      if board.in_check?(current_player.color)
        puts "#{current_player.color} is in check."
      end
      take_turn
      swap_player!
    end
  end

  def over?
   if board.checkmate?(current_player.color)
    swap_player!
    renderer.render
    puts "Game over: #{current_player.color} won"
    return true
   end
  end

  def take_turn
    start_pos = nil
  # prompt current player to enter a starting position
    loop do
      puts "Select a piece to move: "
      coordinates = current_player.verify_input
      if coordinates == 'save'
        save_game
        coordinates = current_player.verify_input
      end
      start_pos = convert_input(coordinates)
      if board[start_pos].color == current_player.color && !board[start_pos].safe_moves.empty?
        break
      end
      puts "Did not select a #{current_player.color}'s piece or that piece can't safely move"
    end
  # prompt current player to enter an ending position
    loop do
      puts "Select a position to move to:"
      coordinates = current_player.verify_input
      if coordinates == 'save'
        save_game
        coordinates = current_player.verify_input
      end
      end_pos = convert_input(coordinates)
      begin
        board.move_piece(start_pos, end_pos)
        break
      rescue InvalidMoveError => e
        puts e.message
      end
    end
  end

  def convert_input(coordinates)
    result = []
    p coordinates
    result << board.row_map.fetch(coordinates[1])
    result << board.column_map.fetch(coordinates[0])
    p result
    result
  end


  def swap_player!
    self.current_player = (current_player == player1 ? player2 : player1)
  end
end