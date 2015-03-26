class Pawn
  #input
  #output

  def initialize
  end

end

class Knight
    #input
  #output

  def initialize
  end


end

class Rook
    #input
  #output

  def initialize
    @position = position
  end

end

class Bishop
    #input
  #output

  def initialize
  end


end

class Queen
    #input
  #output

  def initialize
  end

end

class King
    #input
  #output

  def initialize
  end

end




class Board

  BOARD_HEIGHT = 8
  def initialize
  #output: make a nested array, @board that is BOARD_HEIGHT squared with all spaces = nil (default)
  #make white pieces and black pieces arrays fill with all possible pieces(make new objects) with default positions
  end

  def place(piece, position = piece.position)
  #input: starting_position@white_piece_array[0], rook.position
  #output: add this to @board(initially based off of default position)
  end

  def get_object_from_position

  end

  def check_move_helper
    #input:
  end

  def rqb_move
    #rook,queen,bishop
    #input: position
    #output: array of valid moves
    #base case:
    #if space in path has no object, push to valid move array
  end

  def king_knight_move

  end

  def pawn_move

  end

end
