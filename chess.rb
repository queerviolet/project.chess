class Piece
  attr_reader :state
  def initialize(location, state, move_pattern, board, args={}) # pass board in as argument
    # use current @board so that pieces are aware of board methods
    @board = board
    @location = location
    @state = state
    @move_pattern = move_pattern
    @capture_pattern = args.fetch(:capture_pattern, move_pattern)
    @can_jump = args.fetch(:can_jump, false)
    @can_reverse = args.fetch(:can_reverse, true)
  end

  def valid_move?(row,col)
    @move_pattern == [@location[0] - row, @location[1] - col].map { |el| el.abs}
  end
# board move may return to/call update_board, place_on_cell, and/or remove
  def move(row,col)
    if valid_move?(row,col)
      if @board.cell_empty?(row,col)
        @location = [row,col]
        #@board.update_board
        #@board.place_on_cell(row,col)
      elsif victim_capturable?(row,col)
        @location = [row,col]
        #@board.remove(row,col)
        #@board.update_board
      end
    end
  end

  def victim_capturable?(victim_state)
    @state != victim_state
  end
end

class Pawn < Piece

end

class Rook < Piece

end

class Knight < Piece

end

class Bishop < Piece

end

class Queen < Piece

end

class King < Piece

end
# test_piece = Piece.new([0,0], "black", [1,0])
# p test_piece.move(1,0)


# ----------------------------------------------------------------------------------


class Game
  attr_reader :board
  #creates new board object in initialize
  def initialize
    #needs a data structure to hold player_1 and player_2
    #@board = Board.new
  end
  #prints board after every move
  #to_s expects the board object to have a #board attr_reader
  def to_s
    @board.board.map do |row|
      "#{row}"
    end.join("\n")
  end
  #strips user input [col, row] into row, col format
  #expects a move array with 2 elements
  def strip_move(move)
    alpha = [*"a".."z"]
    alpha.map.with_index do |letter, i|
      if move[0] == letter
        move[0] = i
      end
    end
      move.reverse
  end

  #alternates player turns UNTIL game OVER
  def play
  #UNTIL check_mate?
  #player_1.turn(gets.chomp)
  #player_2.turn(gets.chomp)
  #ENDUNTIL
  end

  #checks to see if there is a check
  def check(player)

  end

  def check_mate(player)

  end

  def turn(move)
    # determine piece-type
    # ask piece if move is valid for piece-type
    # ask board if cell is empty
    # if board is empty AND move is valid, move piece
    # if cell filled by piece, ask if piece is capturable
    # if YES, capture and move
    # if NO, return "invalid move"
  end
end
