#later:
#castling
#stalemate
#check/check mate
#promotion
#undo_move
#speed chess
#piece class?

NORTH = [1,0]
SOUTH = [-1, 0]
WEST = [0, -1]
EAST = [0, 1]
NORTHEAST = [1, 1]
NORTHWEST = [1, -1]
SOUTHEAST = [-1, 1]
SOUTHWEST = [-1, -1]


class Pawn

  attr_reader :color, :moves, :attack
  attr_accessor :first_move, :position

  def initialize(args)
    @postion = args[:position]
    @color = args[:color]
    @first_move = true

    if @color == "white"
      @moves = [NORTH]
      @attack = [NORTHEAST, NORTHWEST]
    else
      @moves = [SOUTH]
      @attack = [SOUTHEAST, SOUTHWEST]
    end
  end
end

class Knight

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @moves = [NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST]
    @color = args[:color]
    @position = args[:position]
  end
end

class Rook

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @position = args[:position]
    @moves = [NORTH, SOUTH, EAST, WEST]
    @color = args[:color]
  end
end

class Bishop

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @position = args[:position]
    @moves = [NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST]
    @color = args[:color]
  end
end

class Queen

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @moves = [NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST]
    @color = args[:color]
    @position = args[:position]
  end

end

class King

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @postion = args[:position]
    @color = color[:color]
    @moves = [NORTH, NORTHEAST, EAST, SOUTHEAST, SOUTH, SOUTHWEST, WEST, NORTHWEST]
  end

end




class Board

  def initialize
    @board = Array.new(8) {Array.new(8)}
    @white_pieces_array = []
    #white pawns
    for x in 0..7 do
      args = {
        color: "white",
        position: [1, x]
      }
     @white_pieces_array << Pawn.new(args)
    end
    #white rooks
    args = {
      color: "white",
      position: [0, 0]
    }
    @white_pieces_array << Rook.new(args)

    args = {
      color: "white",
      position: [0,7]
    }
    @white_pieces_array << Rook.new(args)
    #white bishop
    #white knights
    #white queen
    #white king
    @black_pieces_array = []
    #black pawns
    for x in 0..7 do
      args = {
        color: "black",
        position: [6, x]
      }
     @black_pieces_array << Pawn.new(args)
    end
    p @white_pieces_array
    #p @black_pieces_array
    #black rooks
    #black bishop
    #black knights
    #black queen
    #black king
  #output: make a nested array, @board that is BOARD_HEIGHT squared with all spaces = nil (default)
  #make white pieces and black pieces arrays fill with all possible pieces(make new objects) with default positions
  end

  def place(piece, position = piece.position)
  #input: starting_position@white_piece_array[0], rook.position
  #output: add this to @board(initially based off of default position)
  end

  def get_object_from_position
    #input: position in array
    #output: the object in that position
  end

  def check_move_helper
    #input: object
    #output: object, move method direction
  end

  def rqb_move
    #rook,queen,bishop
    #input: object
    #output: array of valid moves
    #recursively check in all directions that correspond to the piece
    #if space in path has no object, push to valid move array and then check again in that direction
    #false if the space != and piece is the same as the object it hits change directions
    #false if the space != nil and piece is the opposite of color push to array and change directions
    #false if the space is not in the array
  end

  def king_move
    #input: object
    #output: returns array of valid moves
    #checks all 8 possibilities

  end

  def knight_move
  end

  def pawn_move
    #input: object
    #output: array of valid moves
    # if first_move is true, then check for two spaces as well set first_move to false
    #evaluate diagonals for enemy pieces
    #evaluate one space
  end

  def move
    #input: take piece
    #output: return the changed board
    #modifies the board_array and piece.position
  end

end

board = Board.new
