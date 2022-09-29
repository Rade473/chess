require_relative 'board'
require_relative 'game'
class Player
  attr_reader :color

  def initialize(color)
    @color = color
  end

  def get_input
     gets.chomp.downcase
  end

  def verify_input
    coordinates = []
    loop do
      input = get_input
      if Array('a'..'h').include?(input.[](0)) && input.[](1).to_i.between?(1, 8)
        coordinates << input.[](0)
        coordinates << input.[](1)
        break
      end
      if input == 'save'
        coordinates = input
        break
      end
      puts 'Invalid input, please choose a piece with coordinates like:'
      puts 'e7 or a2'
    end
    coordinates
  end
end