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
  def initialize(color) #add x_location, y_location
    @color = color
  end

  def valid_move?(dx, dy)
    (dx.abs >= 7 && dy = 0) || (dx = 0 && dy.abs >= 7)
  end
end

# pass current_position for current_y, current_x and where
# they want to move it to move_position for move_x, move_y
class Knight < Piece
  def initialize(color) #add x_location, y_location
    @color = color
   # possible_moves from [y][x]= [y+1][x-2], [y-1][x-2], [y+1][x+2], [y-1][x+2], [y+2][x-1], [y-2][x-1], [y+2][x+1], [y-2][x+1]
  end

  def valid_move?(dx, dy)
    (dx.abs = 2 && dy.abs = 1) || (dx.abs = 1 && dy.abs = 2)
  end
end

# pass current_position for current_y, current_x and where
# they want to move it to move_position for move_x, move_y
class Bishop < Piece
  def initialize(color) #add x_location, y_location
    @color = color
  end

  def valid_move?(dx, dy)
    dx.abs = dy.abs
  end
end

# pass current_position for current_y, current_x and where
# they want to move it to move_position for move_x, move_y
class Queen < Piece
  def initialize(color) #add x_location, y_location
    @color = color

  end

  def valid_move?(dx, dy)
    (dx.abs = dy.abs) || (dx.abs >= 7 && dy = 0) || (dx = 0 && dy.abs >= 7)
  end
end

# pass current_position for current_y, current_x and where
# they want to move it to move_position for move_x, move_y
class King < Piece
  def initialize(color) #add x_location, y_location
    @color = color
  end

  def valid_move?(dx, dy)
    (dx.abs = dy.abs = 1) || (dx = 0 && dy.abs = 1) || (dx.abs = 1 && dy = 0)
  end
end

# pass current_position for current_y, current_x and where
# they want to move it to move_position for move_x, move_y
class Pawn < Piece
  def initialize(color) #add x_location, y_location
    @color = color
  end

  def valid_move?(dx, dy)
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

# Move logic
#  (Game) User will input the coordinate of the piece he wants to move first via gets.chomp (start location)
#  (Game) User will input the coordinate to move the piece to via gets.chomp (end location)
#  (Board) Calculate dx (end_x - start_x) and dy (end_x - start_x)
#  (subclass of Piece) Check if dx, dy is valid in terms of signature moves
#  (subclass of Piece) Will return that move is valid to Board
#  (Board) Will take start and end coordinates of move and will check path for validity
#  (Board) If valid, will write over Board with new placement of specific piece
#  (Piece) If valid, will reset location to new location


#user will provide letter+y-value via gets
#split letter and y-value
#convert letter to x-value

puts @board

class Board
  def initialize
  @letter_to_x_value = {
                  "A" => 0,
                  "B" => 1,
                  "C" => 2,
                  "D" => 3,
                  "E" => 4,
                  "F" => 5,
                  "G" => 6,
                  "H" => 7
                  }
  @board = {
      {0 => 7} => Rook.new("black"),
      {1 => 7} => Knight.new("black"),
      {2 => 7} => Bishop.new("black"),
      {3 => 7} => Queen.new("black"),
      {4 => 7} => King.new("black"),
      {5 => 7} => Bishop.new("black"),
      {6 => 7} => Knight.new("black"),
      {7 => 7} => Rook.new("black"),

      {0 => 6} => Pawn.new("black"),
      {1 => 6} => Pawn.new("black"),
      {2 => 6} => Pawn.new("black"),
      {3 => 6} => Pawn.new("black"),
      {4 => 6} => Pawn.new("black"),
      {5 => 6} => Pawn.new("black"),
      {6 => 6} => Pawn.new("black"),
      {7 => 6} => Pawn.new("black"),

      {0 => 5} => nil,
      {1 => 5} => nil,
      {2 => 5} => nil,
      {3 => 5} => nil,
      {4 => 5} => nil,
      {5 => 5} => nil,
      {6 => 5} => nil,
      {7 => 5} => nil,

      {0 => 4} => nil,
      {1 => 4} => nil,
      {2 => 4} => nil,
      {3 => 4} => nil,
      {4 => 4} => nil,
      {5 => 4} => nil,
      {6 => 4} => nil,
      {7 => 4} => nil,

      {0 => 3} => nil,
      {1 => 3} => nil,
      {2 => 3} => nil,
      {3 => 3} => nil,
      {4 => 3} => nil,
      {5 => 3} => nil,
      {6 => 3} => nil,
      {7 => 3} => nil,

      {0 => 2} => nil,
      {1 => 2} => nil,
      {2 => 2} => nil,
      {3 => 2} => nil,
      {4 => 2} => nil,
      {5 => 2} => nil,
      {6 => 2} => nil,
      {7 => 2} => nil,

      {0 => 1} => Pawn.new("white"),
      {1 => 1} => Pawn.new("white"),
      {2 => 1} => Pawn.new("white"),
      {3 => 1} => Pawn.new("white"),
      {4 => 1} => Pawn.new("white"),
      {5 => 1} => Pawn.new("white"),
      {6 => 1} => Pawn.new("white"),
      {7 => 1} => Pawn.new("white"),

      {0 => 0} => Rook.new("white"),
      {1 => 0} => Knight.new("white"),
      {2 => 0} => Bishop.new("white"),
      {3 => 0} => Queen.new("white"),
      {4 => 0} => King.new("white"),
      {5 => 0} => Bishop.new("white"),
      {6 => 0} => Knight.new("white"),
      {7 => 0} => Rook.new("white")
  }

  p @board.values.first

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

board = Board.new
