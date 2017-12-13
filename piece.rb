class Piece
  # CONVERSION = {:Knight => " N ",
  #               :King => " K " ,
  #               :Queen => " Q " ,
  #               :NullPiece => " _ "
  #
  #
  #
  #
  #
  #
                    # }
  attr_reader :direction, :color, :board
  attr_accessor :pos

  def initialize(color, pos, board)
    @board = board
    @color = color
    @pos = pos
  end

  def to_s

  end

  def empty?

  end

  def symbol

  end

  def valid_moves

    total = @board[pos].moves

    result = []
    total.each do |el|

      result << el if @board[el].color != color && !move_into_check?(el)

    end

    result
  end


  def move_into_check?(to_pos)
    if @board[to_pos].is_a?(NullPiece)
      old_pos = pos
      board.move_piece(old_pos, to_pos)
      bool = board.in_check?(color) #checks if player is in check
      board.move_piece(to_pos, old_pos)
      return bool
    else
      old_pos = pos
      attacked_piece = board[to_pos].dup
      board.move_piece(old_pos, to_pos)
      bool = board.in_check?(color)
      board.move_piece(to_pos, old_pos)
      board[to_pos] = attacked_piece
      return bool
    end
  end

  def inspect
    "#{color} #{self.class}"
  end


end
