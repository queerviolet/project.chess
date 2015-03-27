 #later:
#castling
#stalemate
#check/check mate
#promotion
#undo_move
#speed chess
#piece class?
require "byebug"

NORTH = [1,0]
NORTHEAST = [1, 1]
EAST = [0, 1]
SOUTHEAST = [-1, 1]
SOUTH = [-1, 0]
SOUTHWEST = [-1, -1]
WEST = [0, -1]
NORTHWEST = [1, -1]



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
    @moves = [[2,1],[1,2],[2,-1],[1,-2],[-2,-1],[-1,-2],[-2,1],[-1,2]]
  end
end

class Rook

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @position = args[:position]
    @color = args[:color]
    @moves = [NORTH, EAST, SOUTH, WEST]
  end
end

class Bishop

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @position = args[:position]
    @color = args[:color]
    @moves = [NORTHEAST, SOUTHEAST, SOUTHWEST, NORTHWEST]

  end
end

class Queen

  attr_reader :color, :moves
  attr_accessor :position

  def initialize(args)
    @position = args[:position]
    @color = args[:color]
    @moves = [NORTH, NORTHEAST, EAST, SOUTHEAST, SOUTH, SOUTHWEST, WEST, NORTHWEST]
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
      @white_pieces_array << Pawn.new({color: "white", position: [1, x]})
    end
    @white_pieces_array << Rook.new({color: "white", position: [0, 0]})
    @white_pieces_array << Rook.new({color: "white", position: [0,7]})
    @white_pieces_array << Bishop.new({color: "white", position: [0,2]})
    @white_pieces_array << Bishop.new({color: "white", position: [0,5]})
    @white_pieces_array << Knight.new({color: "white", position: [0,1]})
    @white_pieces_array << Knight.new({color: "white", position: [0,6]})
    @white_pieces_array << Queen.new({color: "white", position: [0,3]})
    @white_pieces_array << King.new({color: "white", position: [0,4]})
  end

  def initialize_black_pieces
    @black_pieces_array = []
    for x in 0..7 do
      @black_pieces_array << Pawn.new({color: "black", position: [6, x]})
    end
    @black_pieces_array << Rook.new({color: "black", position: [7, 0]})
    @black_pieces_array << Rook.new({color: "black", position: [7, 7]})
    @black_pieces_array << Bishop.new({color: "black", position: [7,2]})
    @black_pieces_array << Bishop.new({color: "black", position: [7,5]})
    @black_pieces_array << Knight.new({color: "black", position: [7,1]})
    @black_pieces_array << Knight.new({color: "black", position: [7,6]})
    @black_pieces_array << Queen.new({color: "black", position: [7,3]})
    @black_pieces_array << King.new({color: "black", position: [7,4]})
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
    piece.position = position
  end

  def to_s
    counter = 8
    @board.reverse.each do |row|
      print "#{counter}\s"
      row.each do |piece|
        if piece.is_a?(Rook) && piece.color == "black"
          print "\u265C\s"
        elsif piece.is_a?(Rook) && piece.color == "white"
          print "\u2656\s"
        elsif piece.is_a?(Knight) && piece.color == "black"
          print "\u265E\s"
        elsif piece.is_a?(Knight) && piece.color == "white"
          print "\u2658\s"
        elsif piece.is_a?(Bishop) && piece.color == "black"
          print "\u265D\s"
        elsif piece.is_a?(Bishop) && piece.color == "white"
          print "\u2657\s"
        elsif piece.is_a?(Queen) && piece.color == "black"
          print "\u265B\s"
        elsif piece.is_a?(Queen) && piece.color == "white"
          print "\u2655\s"
        elsif piece.is_a?(King) && piece.color == "black"
          print "\u265A\s"
        elsif piece.is_a?(King) && piece.color == "white"
          print "\u2654\s"
        elsif piece.is_a?(Pawn) && piece.color == "black"
          print "\u265F\s"
        elsif piece.is_a?(Pawn) && piece.color == "white"
          print "\u2659\s"
        elsif piece == nil
          print ". "
        else
          print piece
        end
      end
      counter -= 1
      puts "\n"
    end
    puts "\s" + "\s" + %w[a b c d e f g h].join(' ')
  end

  def check_move_helper(piece)
    pawn_move(piece) if piece.is_a?(Pawn)
    king_move(piece) if piece.is_a?(King)
    knight_move(piece) if piece.is_a?(Knight)
    rqb_move(piece) if piece.is_a?(Rook) || piece.is_a?(Queen) || piece.is_a?(Bishop)
  end

  def rqb_move(piece)
    valid_moves = []
    move = 0
    num_of_directions = piece.moves.length
    num_of_directions.times do
      rqb_move_recursive(piece, piece.moves[move], temp_row = piece.position[0], temp_col = piece.position[1], valid_moves)
      move += 1
    end
    valid_moves
  end

  def rqb_move_recursive(piece, direction, temp_row, temp_col, valid_moves)
    temp_row += direction[0]
    temp_col += direction[1]
    return valid_moves if !temp_row .between?(0,7) || !temp_col.between?(0, 7)
    if @board[temp_row][temp_col] == nil
      valid_moves << [temp_row, temp_col]
    else
      if @board[temp_row][temp_col].color == piece.color
        return valid_moves
      else
        valid_moves << [temp_row, temp_col]
        return valid_moves
      end
    end
    valid_moves = rqb_move_recursive(piece, direction, temp_row, temp_col, valid_moves)
    return valid_moves
  end

  def king_move(piece)
    valid_moves = []
    move = 0
    num_of_directions = piece.moves.length
    num_of_directions.times do
      temp_row = piece.position[0] + piece.moves[move][0]
      temp_col = piece.position[1] + piece.moves[move][1]
      if temp_row.between?(0,7) && temp_col.between?(0, 7)
        if @board[temp_row][temp_col] == nil || @board[temp_row][temp_col].color != piece.color
          valid_moves << [temp_row, temp_col]
        end
        move += 1
      end
    end
    valid_moves
  end

  def knight_move(piece)
    valid_moves = []
    move = 0
    num_of_directions = piece.moves.length #8
    num_of_directions.times do
      temp_row = piece.position[0] + piece.moves[move][0] #[0][0] row [1][0]
      temp_col = piece.position[1] + piece.moves[move][1] #[0][1] col [1][1]
      if temp_row.between?(0,7) && temp_col.between?(0, 7)
        if @board[temp_row][temp_col] == nil || @board[temp_row][temp_col].color != piece.color
          valid_moves << [temp_row, temp_col]
        end
        move += 1
      end
    end
    valid_moves
  end

  def pawn_move(piece)
    valid_moves = []
    temp_row = piece.position[0] + piece.moves[0][0]
    temp_col = piece.position[1] + piece.moves[0][1]
    if temp_row.between?(0,7) && temp_col.between?(0, 7) && @board[temp_row][temp_col] == nil
      valid_moves << [temp_row, temp_col]
      if piece.first_move == true
        temp_row += piece.moves[0][0]
        temp_col += piece.moves[0][1]
        if temp_row.between?(0,7) && temp_col.between?(0, 7) && @board[temp_row][temp_col] == nil
          valid_moves << [temp_row, temp_col]
        end
      end
    end
    for x in 0..1 do
      temp_row = piece.position[0] + piece.attack[x][0]
      temp_col = piece.position[1] + piece.attack[x][1]
      if temp_row.between?(0,7) && temp_col.between?(0, 7) && @board[temp_row][temp_col] != nil && @board[temp_row][temp_col].color != piece.color
        valid_moves << [temp_row, temp_col]
      end
    end
    valid_moves
  end

end

