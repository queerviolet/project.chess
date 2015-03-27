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
    @position = args[:position]
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
    @position = args[:position]
    @color = args[:color]
    @moves = [NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST]
  end
end

class Rook

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @position = args[:position]
    @color = args[:color]
    @moves = [NORTH, SOUTH, EAST, WEST]
  end
end

class Bishop

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @position = args[:position]
    @color = args[:color]
    @moves = [NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST]
  end
end

class Queen

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @position = args[:position]
    @color = args[:color]
    @moves = [NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST]
  end
end

class King

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @position = args[:position]
    @color = args[:color]
    @moves = [NORTH, NORTHEAST, EAST, SOUTHEAST, SOUTH, SOUTHWEST, WEST, NORTHWEST]
  end

end

class Board

  attr_accessor :board, :white_pieces_array, :black_pieces_array

  def initialize
    @board = Array.new(8) {Array.new(8)}
    initialize_white_pieces
    initialize_black_pieces
  end

  def initialize_white_pieces
    @white_pieces_array = []
    for x in 0..7 do
      args = {
        color: "white",
        position: [1, x]
      }
      @white_pieces_array << Pawn.new(args)
      end

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

    args = {
      color: "white",
      position: [0,2]
    }
    @white_pieces_array << Bishop.new(args)

    args = {
      color: "white",
      position: [0,5]
    }
    @white_pieces_array << Bishop.new(args)


    args = {
      color: "white",
      position: [0,1]
    }
    @white_pieces_array << Knight.new(args)

    args = {
      color: "white",
      position: [0,6]
    }
    @white_pieces_array << Knight.new(args)

    args = {
      color: "white",
      position: [0,3]
    }
    @white_pieces_array << Queen.new(args)
    args = {
      color: "white",
      position: [0,4]
    }
    @white_pieces_array << King.new(args)
  end

  def initialize_black_pieces
    @black_pieces_array = []
    for x in 0..7 do
    args = {
      color: "black",
      position: [6, x]
    }
    @black_pieces_array << Pawn.new(args)
    end
    args = {
      color: "black",
      position: [7, 0]
    }
    @black_pieces_array << Rook.new(args)

    args = {
      color: "black",
      position: [7,7]
    }
    @black_pieces_array << Rook.new(args)
    args = {
      color: "black",
      position: [7,2]
    }
    @black_pieces_array << Bishop.new(args)

    args = {
      color: "black",
      position: [7,5]
    }
    @black_pieces_array << Bishop.new(args)

    args = {
      color: "black",
      position: [7,1]
    }
    @black_pieces_array << Knight.new(args)

    args = {
      color: "black",
      position: [7,6]
    }
    @black_pieces_array << Knight.new(args)

    args = {
      color: "black",
      position: [7,3]
    }
    @black_pieces_array << Queen.new(args)

    args = {
      color: "black",
      position: [7,4]
    }
    @black_pieces_array << King.new(args)
  end

  def set_up_board
    @white_pieces_array.each do |piece|
      place(piece, piece.position)
    end
    @black_pieces_array.each do |piece|
      place(piece, piece.position)
    end
  end

  def place(piece, position)
    @board[position[0]][position[1]] = piece
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

board1 = Board.new
board1.set_up_board

