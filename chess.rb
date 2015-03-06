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

# add module or to class the coordinate comparison
class Rook < Piece
  attr_reader :position, :color
  def initialize(position, color)
    @color = color
    @position = position
    start_coordinates = position.first
    @start_x = start_coordinates[0]
    @start_y = start_coordinates[1]
  end

  def valid?(play)
    end_coordinates = play.first
    end_x = end_coordinates[0]
    end_y = end_coordinates[1]
    dx = end_x - @start_x
    dy = end_y - @start_y
    (dx.abs <= 7 && dy == 0) || (dx == 0 && dy.abs <= 7)
  end
end

class Knight < Piece
  attr_reader :position, :color
  def initialize(position, color)
    @color = color
    @position = position
    start_coordinates = position.first
    @start_x = start_coordinates[0]
    @start_y = start_coordinates[1]
  end

  def valid?(play)
    end_coordinates = play.first
    end_x = end_coordinates[0]
    end_y = end_coordinates[1]
    dx = end_x - @start_x
    dy = end_y - @start_y
    (dx.abs == 2 && dy.abs == 1) || (dx.abs == 1 && dy.abs == 2)
  end
end

class Bishop < Piece
  attr_reader :position, :color
  def initialize(position, color)
    @color = color
    @position = position
    start_coordinates = position.first
    @start_x = start_coordinates[0]
    @start_y = start_coordinates[1]
  end

  def valid?(play)
    end_coordinates = play.first
    end_x = end_coordinates[0]
    end_y = end_coordinates[1]
    dx = end_x - @start_x
    dy = end_y - @start_y
    dx.abs == dy.abs
  end
end

class Queen < Piece
  attr_reader :position, :color
  def initialize(position, color)
    @color = color
    @position = position
    start_coordinates = position.first
    @start_x = start_coordinates[0]
    @start_y = start_coordinates[1]
  end

  def valid?(play)
    end_coordinates = play.first
    end_x = end_coordinates[0]
    end_y = end_coordinates[1]
    dx = end_x - @start_x
    dy = end_y - @start_y
    (dx.abs == dy.abs) || (dx.abs <= 7 && dy == 0) || (dx == 0 && dy.abs <= 7)
  end
end

class King < Piece
  attr_reader :position, :color
  def initialize(position, color)
    @color = color
    @position = position
    start_coordinates = position.first
    @start_x = start_coordinates[0]
    @start_y = start_coordinates[1]
  end

  def valid?(play)
    end_coordinates = play.first
    end_x = end_coordinates[0]
    end_y = end_coordinates[1]
    dx = end_x - @start_x
    dy = end_y - @start_y
    (dx.abs == 1 && dy.abs == 1) || (dx == 0 && dy.abs == 1) || (dx.abs == 1 && dy == 0)
  end
end

class Pawn < Piece
  attr_reader :position, :color
  def initialize(position, color)
    @color = color
    @position = position
    start_coordinates = position.first
    @start_x = start_coordinates[0]
    @start_y = start_coordinates[1]
  end

  def valid?(play)
    end_coordinates = play.first
    end_x = end_coordinates[0]
    end_y = end_coordinates[1]
    dx = end_x - @start_x
    dy = end_y - @start_y
    ((dx == 0 && dy == -1) if @color == "black") || ((dx == 0 && dy == 1) if @color == "white")

   # if move counter == 1
    # if black
      # (dx = 0 && dy = -1) || (dx = 0 && dy = -2)
    # else whites
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

class Board
  attr_accessor :board
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
      {0 => 7} => Rook.new({0 => 7}, "black"),
      {1 => 7} => Knight.new({1 => 7},"black"),
      {2 => 7} => Bishop.new({2 => 7},"black"),
      {3 => 7} => Queen.new({3 => 7},"black"),
      {4 => 7} => King.new({4 => 7},"black"),
      {5 => 7} => Bishop.new({5 => 7},"black"),
      {6 => 7} => Knight.new({6 => 7},"black"),
      {7 => 7} => Rook.new({7 => 7}, "black"),

      {0 => 6} => Pawn.new({0 => 6},"black"),
      {1 => 6} => Pawn.new({1 => 6},"black"),
      {2 => 6} => Pawn.new({2 => 6},"black"),
      {3 => 6} => Pawn.new({3 => 6},"black"),
      {4 => 6} => Pawn.new({4 => 6},"black"),
      {5 => 6} => Pawn.new({5 => 6},"black"),
      {6 => 6} => Pawn.new({6 => 6},"black"),
      {7 => 6} => Pawn.new({7 => 6},"black"),

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

      {0 => 1} => Pawn.new({0 => 1},"white"),
      {1 => 1} => Pawn.new({1 => 1},"white"),
      {2 => 1} => Pawn.new({2 => 1},"white"),
      {3 => 1} => Pawn.new({3 => 1},"white"),
      {4 => 1} => Pawn.new({4 => 1},"white"),
      {5 => 1} => Pawn.new({5 => 1},"white"),
      {6 => 1} => Pawn.new({6 => 1},"white"),
      {7 => 1} => Pawn.new({7 => 1},"white"),

      {0 => 0} => Rook.new({0 => 0},"white"),
      {1 => 0} => Knight.new({1 => 0},"white"),
      {2 => 0} => Bishop.new({2 => 0},"white"),
      {3 => 0} => Queen.new({3 => 0},"white"),
      {4 => 0} => King.new({4 => 0},"white"),
      {5 => 0} => Bishop.new({5 => 0},"white"),
      {6 => 0} => Knight.new({6 => 0},"white"),
      {7 => 0} => Rook.new({7 => 0},"white")
  }

  # p @board.values.first
  # p @board
  # p @board[{7 => 7}].valid?({7 => 6})


  # @board.map do |ele|
  # p  ele[0][0]
  # end

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

rook = Rook.new({7 => 7}, "black")
rook.valid?({6 => 7})
rook.valid?({6 => 6})

# pawn = Pawn.new({4 =>6 }, "black")
# p pawn
# pawn.valid?({ 4 => 5 })
# pawn.valid?({ 5 => 6 })
