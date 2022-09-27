require_relative 'color'

class BoardRendererText
  attr_accessor :board

  def initialize(board)
    @board = board
  end

  def render
    puts '   a  b  c  d  e  f  g  h'
    8.times do |r|
      print "#{8 - r}|"
      8.times do |c|
        if (r+c).odd?
          if board[[r, c]] == nil 
          print '   '.bg_gray
          else
          print " #{board[[r, c]].render} ".bg_gray
          end
        else
          if board[[r, c]] == nil 
            print '   '.bg_yellow
            else
            print " #{board[[r, c]].render} ".bg_yellow
          end
        end
      end
      puts "|#{8 - r}"
    end
    puts '   a  b  c  d  e  f  g  h'
  end
end