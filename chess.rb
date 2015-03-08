class Piece
  attr_reader :state
  def initialize(location, state, move_pattern, args={})
    @location = location
    @state = state
    @move_pattern = move_pattern
    @capture_pattern = args.fetch(:capture_pattern, move_pattern)
    @can_jump = args.fetch(:can_jump, false)
    @can_reverse = args.fetch(:can_reverse, true)
  end

  def valid_move?(row,col)
    # @move_pattern.each do |dy, dx|
    #   return
    @move_pattern[0]/@move_pattern[1] == [(@location[0] - row)/ (@location[1] - col)].abs
  end

  def move(row,col)
    @location = [row,col]
  end

  def victim_capturable?(victim_state)
    @state != victim_state
  end
end

class Pawn < Piece

end

class Rook < Piece
  def initialize(location, state)
    super(location, state, [[0,1], [1,0]], can_jump: true)
  end

  def valid_move?(row,col)
    (@move_pattern[0][0]/@move_pattern[0][1] == (@location[0] - row)/ (@location[1] - col).abs) ||
    (@move_pattern[1][0]/@move_pattern[1][1] == (@location[0] - row)/ (@location[1] - col).abs)
  end
end

class Knight < Piece
  def initialize(location, state)
    super(location, state, [[2,1.0], [1,2.0]], can_jump: true)
  end

  def valid_move?(row,col)
    @move_pattern[0][0]/@move_pattern[0][1] == ((@location[0] - row)/ (@location[1] - col).to_f).abs ||
    @move_pattern[1][0]/@move_pattern[1][1] == ((@location[0] - row)/ (@location[1] - col).to_f).abs
  end
end

class Bishop < Piece

end

class Queen < Piece

end

class King < Piece
  def initialize(location, state)
    super(location, state, [[0,1], [1,0], [1,1]], can_jump: true)
  end

  def valid_move?(row,col)
    @move_pattern[0] == [@location[0]-row, @location[1]-col].map { |el| el.abs } ||
    @move_pattern[1] == [@location[0]-row, @location[1]-col].map { |el| el.abs } ||
    @move_pattern[2] == [@location[0]-row, @location[1]-col].map { |el| el.abs }
  end
end

# test_king = King.new([8,4], "white")
# p test_king
# p test_king.valid_move?(8,6) == false
# ♟ = Pawn.new([0,0], "black", [1,0], can_reverse: false, capture_pattern: [1,1])
# p ♟.is_a?(Pawn)

# puts "Testing chess symbols"
# ♖ = "rook"
# p ♖
# p test_piece.move(1,0)


# ----------------------------------------------------------------------------------


class Game
  attr_accessor :board
#   #creates new board object in initialize
  def initialize
#     #needs a data structure to hold player_1 and player_2
    @board = [["♜","♞","♝","♛","♚","♝","♞","♜"],
    ("♟"*8).split(""),
    (" "*8).split(""),
    (" "*8).split(""),
    (" "*8).split(""),
    (" "*8).split(""),
    ("♙"*8).split(""),
    ["♖","♘","♗","♕","♔","♗","♘","♖"]]
  end
#   #prints board after every move
#   #to_s expects the board object to have a #board attr_reader
#   def to_s
#     @board.board.map do |row|
#       "#{row}"
#     end.join("\n")
#   end
#   #strips user input [col, row] into row, col format
#   #expects a move array with 2 elements
  def strip_move(move)
    alpha = [*"a".."z"]
    alpha.map.with_index do |letter, i|
      if move[0] == letter
        move[0] = i
      end
    end
      move[1]-=1
      move.reverse
  end

#   #alternates player turns UNTIL game OVER
#   def play
#   #UNTIL check_mate?
#   #player_1.turn(gets.chomp)
#   #player_2.turn(gets.chomp)
#   #ENDUNTIL
#   end

#   #checks to see if there is a check
#   def check(player)

#   end

#   def check_mate(player)

#   end


    def turn
      puts "Enter the piece you'd like to move by coordinates:"
      current_col, current_row = gets.chomp.split("")
      current_row, current_col = strip_move([current_col, current_row.to_i])
      puts "Enter where you'd like to move the piece:"
      desired_col, desired_row = gets.chomp.split("")
      #assigning row and col variables (reversed from user format, which is col, row)
      desired_row, desired_col = strip_move([desired_col, desired_row.to_i])
      p [desired_row, desired_col]
    # # determine piece-type:
      piece = @board[current_row][current_col]
    # Is player's desired moved a valid move for that piece type?
      move_validity = piece.valid_move?(desired_row, desired_col) #returns a bool
      if move_validity == true
        if @board.cell_empty?(desired_row, desired_col) == false
        desired_cell_piece = @board[desired_row][desired_col]
    #     if piece.victim_capturable(desired_cell_piece.state)
    #       #capture victim
    #     else
    #       #return invalid move
    #     end
    #   else
    #     #move piece to desired cell
      end
    end
    # else
    #   "invalid move"
    end
end

# game = Game.new
# game.board[0][4] = King.new([0, 4], "black")
# game.board[1][2] = Knight.new([1, 2], "white")
# p game
# # p game.strip_move(["b", 0])
# game.turn
# knight = Knight.new([1, 2], "white")
# p knight.valid_move?(0, 4)
# # ----------------------------------------------------------------------------------


class Board
attr_accessor :board, :captured_pieces
  def initialize
   @board = [["♜","♞","♝","♛","♚","♝","♞","♜"],
    ("♟"*8).split(""),
    (" "*8).split(""),
    (" "*8).split(""),
    (" "*8).split(""),
    (" "*8).split(""),
    ("♙"*8).split(""),
    ["♖","♘","♗","♕","♔","♗","♘","♖"]]
    @captured_pieces = []
    @board[0][0] = Rook.new([0,0],'black')
    @board[0][1] = Knight.new([0,1],'black')
    # @board[0][2] = Bishop.new([0,2],'black')
    # @board[0][3] = Queen.new([0,3],'black')
    @board[0][4] = King.new([0,4],'black')
    # @board[0][5] = Bishop.new([0,5],'black')
    @board[0][6] = Knight.new([0,6],'black')
    @board[0][7] = Rook.new([0,7],'black')
    # @board[1].each do |cell|
      # (0..7).each do |n|
        # @board[1][cell] = Pawn.new([1,n],'black')
      # end
    # end

    # @board[6].each do |cell|
      # (0..7).each do |n|
        # @board[1][cell] = Pawn.new([1,n],'white')
      # end
    # end
    @board[7][0] = Rook.new([7,0],'white')
    @board[7][1] = Knight.new([7,1],'white')
    # @board[7][2] = Bishop.new([7,2],'white')
    # @board[7][3] = Queen.new([7,3],'white')
    @board[7][4] = King.new([7,4],'white')
    # @board[7][5] = Bishop.new([7,5],'white')
    @board[7][6] = Knight.new([7,6],'white')
    @board[7][7] = Rook.new([7,7],'white')
  end

  def cell_empty?(y,x)
    @board[y][x] == " "
  end

  def remove(y,x)
    @board[y][x] = " "
  end

  def send_piece(y,x)
    @captured_pieces << @board[y][x]
  end

  def update_board
    #scans every piece's new location and updates on board
  end

  def path_clear?(original_coordinate, desired_coordinate, piece)
    # if piece can jump return true
    return true if piece.can_jump

    # negative means going up, positive means going down
    diff_column = desired_coordinate[0] - original_coordinate[0]
    column_step = diff_column / diff_column.abs
    # negative means going left, positive means going right
    diff_row = desired_coordinate[1] - original_coordinate[1]
    row_step = diff_row / diff_row.abs

    new_column = original_coordinate[0]
    new_row = original_coordinate[1]

    # if moving diagonal
    if(diff_column.abs == diff_row.abs)
      (1..diff_column.abs).each do |step|
        new_column += column_step
        new_row += row_step
        return false if cell_empty?(new_column, new_row)
      end
    # if moving vertically
    elsif diff_row == 0
      (1..diff_column.abs).each do |step|
        new_column += column_step
        return false if cell_empty?(new_column, new_row)
      end
    # if moving horizontally
    elsif diff_row == 0
      (1..diff_column.abs).each do |step|
        new_row += row_step
        return false if cell_empty?(new_column, new_row)
      end
    end

    return true
  end

end


