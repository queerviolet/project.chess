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

# pass current_position for current_y, current_x and where
# they want to move it to move_position for move_x, move_y
class Rook < Piece
# include Movement
  def initialize(color)
    @color = color
  end

  def valid_move?(dy, dx)
    (dx.abs >= 7 && dy = 0) || (dx = 0 && dy.abs >= 7)
  end
end

# pass current_position for current_y, current_x and where
# they want to move it to move_position for move_x, move_y
class Knight < Piece
  def initialize(color)
    @color = color
   # possible_moves from [y][x]= [y+1][x-2], [y-1][x-2], [y+1][x+2], [y-1][x+2], [y+2][x-1], [y-2][x-1], [y+2][x+1], [y-2][x+1]
  end

  def valid_move?(dy, dx)
    (dx.abs = 2 && dy.abs = 1) || (dx.abs = 1 && dy.abs = 2)
  end
end

# pass current_position for current_y, current_x and where
# they want to move it to move_position for move_x, move_y
class Bishop < Piece
  def initialize(color)
    @color = color
  end

  def valid_move?(dy, dx)
    dx.abs = dy.abs
  end
end

# pass current_position for current_y, current_x and where
# they want to move it to move_position for move_x, move_y
class Queen < Piece
  def initialize(color)
    @color = color

  end

  def valid_move?(dy, dx)
    (dx.abs = dy.abs) || (dx.abs >= 7 && dy = 0) || (dx = 0 && dy.abs >= 7)
  end
end

# pass current_position for current_y, current_x and where
# they want to move it to move_position for move_x, move_y
class King < Piece
  def initialize(color)
    @color = color
  end

  def valid_move?(dy, dx)
    (dx.abs = dy.abs = 1) || (dx = 0 && dy.abs = 1) || (dx.abs = 1 && dy = 0)
  end
end

# pass current_position for current_y, current_x and where
# they want to move it to move_position for move_x, move_y
class Pawn < Piece
  def initialize(color)
    @color = color
  end

  def valid_move?(dy, dx)
   # if move counter == 1
    # if black
      # (dx = 0 && dy = -1) || (dx = 0 && dy = -2)
    # else white
      # (dx = 0 && dy = 1) || (dx = 0 && dy = 2)
    # end
   # elsif normal move
    # if black
      # (dx = 0 && dy = -1)
    # else white
      # (dx = 0 && dy = 1)
    # end
  # else attack move
    # if black
      # (dx.abs = 1 && dy = -1)
    # else white
      # (dx.abs = 1 && dy = 1)
    # end
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
      @board[x][1] = Pawn.new( "black")
      @board[x][6] = Pawn.new( "white")
    end

    @board[0][0] = Rook.new("black")
    @board[1][0] = Knight.new("black")
    @board[2][0] = Bishop.new("black")
    @board[3][0] = Queen.new( "black")
    @board[4][0] = King.new( "black")
    @board[5][0] = Bishop.new( "black")
    @board[6][0] = Knight.new( "black")
    @board[7][0] = Rook.new( "black")

    @board[0][7] = Rook.new( "white")
    @board[1][7] = Knight.new( "white")
    @board[2][7] = Bishop.new( "white")
    @board[3][7] = King.new( "white")
    @board[4][7] = Queen.new( "white")
    @board[5][7] = Bishop.new( "white")
    @board[6][7] = Knight.new( "white")
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
