class Piece
  def initialize
    #@type = type (pawn, rook, knight, queen, bishop, king)
    #@available_paths(@type)
    #@color (white or black)
  end
# making case statement for pieces by type

  def self.make(type)

  end

  def available_path(type)
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

class Board
  def initialize
    #set a width(8) and a height(8)
    #create an array of piece objects (e.g. @board = Array.new(@width) {[]})

    #location of pieces
    #add pieces to the board
    #create board
  end

  def self.board
     #for players white and black: make all of these things -------
                      #board = ['Piece.new(rook, color)']
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
