class Game
  def initialize
    #x positions, i.e. "A5" is "05"
    @letter_positions = {
      "A" => 0,
      "B" => 1,
      "C" => 2,
      "D" => 3,
      "E" => 4,
      "F" => 5,
      "G" => 6,
      "H" => 7
    }
  end
end

class Board
  attr_accessor :board
  def initialize
  #key piece objects to board coordinates
  @board = {
      [0,7] => Rook.new("black"),
      [1,7] => Knight.new("black"),
      [2,7] => Bishop.new("black"),
      [3,7] => Queen.new"black"),
      [4,7] => King.new("black"),
      [5,7] => Bishop.new("black"),
      [6,7] => Knight.new("black"),
      [7,7] => Rook.new("black"),

      [0,6] => Pawn.new("black"),
      [1,6] => Pawn.new("black"),
      [2,6] => Pawn.new("black"),
      [3,6] => Pawn.new("black"),
      [4,6] => Pawn.new("black"),
      [5,6] => Pawn.new("black"),
      [6,6] => Pawn.new("black"),
      [7,6] => Pawn.new("black"),

      [0,5] => nil,
      [1,5] => nil,
      [2,5] => nil,
      [3,5] => nil,
      [4,5] => nil,
      [5,5] => nil,
      [6,5] => nil,
      [7,5] => nil,

      [0,4] => nil,
      [1,4] => nil,
      [2,4] => nil,
      [3,4] => nil,
      [4,4] => nil,
      [5,4] => nil,
      [6,4] => nil,
      [7,4] => nil,

      [0,3] => nil,
      [1,3] => nil,
      [2,3] => nil,
      [3,3] => nil,
      [4,3] => nil,
      [5,3] => nil,
      [6,3] => nil,
      [7,3] => nil,

      [0,2] => nil,
      [1,2] => nil,
      [2,2] => nil,
      [3,2] => nil,
      [4,2] => nil,
      [5,2] => nil,
      [6,2] => nil,
      [7,2] => nil,

      [0,1] => Pawn.new("white"),
      [1,1] => Pawn.new("white"),
      [2,1] => Pawn.new("white"),
      [3,1] => Pawn.new("white"),
      [4,1] => Pawn.new("white"),
      [5,1] => Pawn.new("white"),
      [6,1] => Pawn.new("white"),
      [7,1] => Pawn.new("white"),

      [0,0] => Rook.new("white"),
      [1,0] => Knight.new("white"),
      [2,0] => Bishop.new("white"),
      [3,0] => Queen.new("white"),
      [4,0] => King.new("white"),
      [5,0] => Bishop.new("white"),
      [6,0] => Knight.new("white"),
      [7,0] => Rook.new("white")
  }
  end



end

class Piece
  attr_reader :board
  def initialize(board)
    #@available_paths(@type)
    #@color (white or black)
    @board = board
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
    ((dx == 0 && dy == -1) && @color == "black") || ((dx == 0 && dy == 1) && @color == "white")
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

board = Board.new
piece = Piece.new(board.board)
p piece.board


