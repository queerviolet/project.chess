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
