require_relative 'board.rb'
require_relative 'piece.rb'

class Game
  def initialize
    @board = Board.new
    @letters = {
      "A" => 0,
      "B" => 1,
      "C" => 2,
      "D" => 3,
      "E" => 4,
      "F" => 5,
      "G" => 6,
      "H" => 7
    }
    play
  end
  #Finally, we need something to handle the REPL—getting
  #input from the user and printing the board. A Game
  #class would be a good place to keep this code.

  def play
    #  (Game) User will input the coordinate of the piece
    to_s
    # puts "Choose a piece to move."
    # square = gets.chomp.upcase.split("")
    # puts @board.find_piece(square).color
    # coordinates = [@letters[square[0]].to_i, square[1].to_i]
    # puts "Player wants to move #{@board.find_piece([0,0])}"
  end

  #Game gets a board_square from the user.
  def move

    # she/he wants to move first via gets.chomp (start location)
  end

  def to_s
    #Game presents the moves list to the user and says,
    # "user, your move?"
    puts @board
  end

  # Move logic

end

# board = Board.new
# board.find_piece([7,7])
# board.find_piece([1,2])
# board.find_piece([7,5])
# puts "heya"
# puts board.find_piece([5,5]) == nil
# # puts board.check_square([0,6])

# puts board.get_empties.count

game = Game.new

# board = Board.new
# p board.pieces.count
# p piece = Piece.new(:white)
# p piece.color == :white


# king = King.new(:black).moves.length
# puts rook = Rook.new(:black).moves(board)
# biship = Bishop.new(:white).moves.length
# queen = Queen.new(:black).moves.length

# rook = Rook.new(:black)
# p rook.moves([0,0])

board = Board.new
# puts board.find_piece([0,0])
#p board

# board.move!([0,0], [0,1])
#we think 0,4 is the white king
p board.check_path([0,4], [4,4])
king = King.new(:black)







