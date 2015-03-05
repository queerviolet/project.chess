class Piece
  def initialize
    #@type = type (pawn, rook, knight, queen, bishop, king)
    #@available_paths(@type)
    #@color (white or black)
  end
# making case statement for pieces by type

  def self.make

  end

  def available_path
    #case statement depending on type of piece
    #queen can move in any direction (up to 8 spaces)
    #king can move in any direction (one space) at a time
    #pawn can move forward one space (1 or 2 on first move)
    #knight can move x or y in any direction (8 directions)
    #bishop can move on any diagonal (4 directions)
    #rook can move vertically or horizontally(4 directions) any distance
    #stops at own piece
  end

end

class Rook < Piece #Max
  def initialize(color)
    @color = color
  end
end

class Knight < Piece #Tracy
  def initialize(color)
    @color = color
  end
end

class Bishop < Piece #Lauren
  def initialize(color)
    @color = color
  end
end

class Queen < Piece #Kurt
  def initialize(color)
    @color = color
    # a queen moves any amount of spaces in all eight directions
    # until a a piece obstructs it (or player chooses to stop)
    # unless it is an opponent's piece
    # then it captures that piece and takes it's spot
  end
end

class King < Piece
  def initialize(color)
    @color = color
  end
end

class Pawn < Piece
  def initialize(color)
    @color = color
  end
end


class Board
  attr_reader :width, :height

  def initialize(height = 8, width = 8)
    @height, @width = height, width
    @board = Array.new(height) {Array.new(width)}

    #fill the board using [y][x]
    #y is the row and x is the column
    (0..7).each do |x|
      @board[1][x] = Pawn.new( "black")
      @board[6][x] = Pawn.new( "white")
    end

    @board[0][0] = Rook.new("black")
    @board[0][1] = Knight.new("black")
    @board[0][2] = Bishop.new("black")
    @board[0][3] = Queen.new( "black")
    @board[0][4] = King.new( "black")
    @board[0][5] = Bishop.new( "black")
    @board[0][6] = Knight.new( "black")
    @board[0][7] = Rook.new( "black")

    @board[7][0] = Rook.new( "white")
    @board[7][1] = Knight.new( "white")
    @board[7][2] = Bishop.new( "white")
    @board[7][3] = King.new( "white")
    @board[7][4] = Queen.new( "white")
    @board[7][5] = Bishop.new( "white")
    @board[7][6] = Knight.new( "white")
    @board[7][7] = Rook.new( "white")
  end

    #set a width(8) and a height(8)
    #create an array of piece objects (e.g. @board = Array.new(@width) {[]})

    #location of pieces
    #add pieces to the board
    #create board

    #board = ['Rook.new(color)']

  def self.board
     #for players white and black: make all of these things -------
                      #board = ['Rook.new(rook, color)']
      #make eight pawns
      #make two rooks pieces
      #make one king piece
      #make one queen piece
      #make two bishop pieces
      #make two knight pieces
  end

  def space(x,y)

  end

  def check_path
  #to see if the move is valid based on the pieces movement
  #to see if there is a "piece" in the way
  #look at a piece and give you a subset of available options
  end


end

class Game
  def initialize
  end
end

p board = Board.new
