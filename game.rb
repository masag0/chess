require_relative 'board'
require_relative 'display'
require 'colorize'

class Game

  attr_accessor :board, :current_player

  def initialize(player1, player2)
    @board = Board.new()
    @display = Display.new(@board)
    @white = player1
    @black = player2
    @current_player = player1
  end

  def play
    system('clear')
    while true
      render_loop
    end

  end

  def render_loop
    begin
      print "Select Piece"

      from = @display.render
      print "Select Move"

      to = @display.render

      if !@board[from].is_a?(NullPiece) && @board[from].valid_moves.include?(to)
        @board.move_piece(from, to)
      else
        raise ArgumentError.new("INVALID MOVE".colorize(:red))
      end
    rescue ArgumentError => e
      puts e.message
      retry
    end
  end


  private

  # def notify_players
  #   puts "Enter move: x,y"
  #   get_input
  # end

  def swap_turn!

  end

end

if __FILE__ == $0

  game = Game.new("white", "black")
  #
  # game.board.move_piece([0,0],[3,3])
  # game.play
  # p game.board[[3,3]].moves
  # game.board.move_piece([0,2], [3,4])
  # game.play
  # p game.board[[3,4]].moves
  # p game.board[[3,3]].moves
  # game.board.move_piece([0,3], [3,2])
  # game.board.move_piece([0,4], [3,5])
  # game.play
  # p game.board[[3,5]].moves
  # game.board.move_piece([0,1], [3,6])
  # game.play
  # p game.board[[3,6]].moves
  # game.board.move_piece([6,4], [4,4])
  # game.play
  # p game.board[[4,4]].moves
  #
  #
  # game.board.move_piece([0,4], [4,4])
  # p game.board[[4,4]].valid_moves
  # game.board.move_piece([6,4], [4,4])
  game.play
end
