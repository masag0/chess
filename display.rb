require_relative 'board'
require 'colorize'
require_relative 'cursor'
require 'byebug'
class Display

  attr_accessor :cursor

def initialize(board)
  @board = board
  @cursor = Cursor.new([0,0], @board)
end

def render


  @cursor.enter = false
  while @cursor.enter == false
    puts ""
    @board.grid.each_with_index do |arr, x|
      arr.each_with_index do |piece, y|

        if @cursor.cursor_pos == [x,y]

          if piece.color == 'black'
            print piece.to_s.colorize(:green).colorize( :background => :yellow)
          else
            print piece.to_s.colorize(:red).colorize( :background => :yellow)
          end
        else

          if piece.color == 'black'
            if x % 2 == 0 && y % 2 == 1
              print piece.to_s.colorize(:green).colorize( :background => :black)
            end
            if x % 2 == 1 && y % 2 == 0
              print piece.to_s.colorize(:green).colorize( :background => :black)
            end
            if x % 2 == 1 && y % 2 == 1
              print piece.to_s.colorize(:green).colorize( :background => :white)
            end
            if x % 2 == 0 && y % 2 == 0
              print piece.to_s.colorize(:green).colorize( :background => :white)
            end


          elsif piece.color == 'white'
            if x % 2 == 0 && y % 2 == 1
              print piece.to_s.colorize(:red).colorize( :background => :black)
            end
            if x % 2 == 1 && y % 2 == 0
              print piece.to_s.colorize(:red).colorize( :background => :black)
            end
            if x % 2 == 1 && y % 2 == 1
              print piece.to_s.colorize(:red).colorize( :background => :white)
            end
            if x % 2 == 0 && y % 2 == 0
              print piece.to_s.colorize(:red).colorize( :background => :white)
            end
          else
            if x % 2 == 0 && y % 2 == 1
              print piece.to_s.colorize(:light_blue ).colorize( :background => :black)
            end
            if x % 2 == 1 && y % 2 == 0
              print piece.to_s.colorize(:light_blue ).colorize( :background => :black)
            end
            if x % 2 == 1 && y % 2 == 1
              print piece.to_s.colorize(:light_blue ).colorize( :background => :white)
            end
            if x % 2 == 0 && y % 2 == 0
              print piece.to_s.colorize(:light_blue ).colorize( :background => :white)
            end

          end

        end
      end
      puts ""
    end
    @cursor.cursor_pos = @cursor.get_input
    
    system("clear")
  end

  valid = @board[@cursor.cursor_pos].valid_moves
  print "Valid moves: #{valid} " unless valid.nil? || valid.empty?
  @cursor.cursor_pos



  #@board[cursor_position]
end

def move(new_pos)

end

end
