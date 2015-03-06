class Piece
  def initialize(location, state, move_pattern, args={})
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

  def move(row,col)
    if valid_move?
      if cell_empty?(row,col)
        @location = [row,col]
      elsif
    # if @move_pattern == [@location[0] - row, @location[1] - col].map { |el| el.abs}
    #   return row,col
    end
    return @location
  end

  def victim_capturable?(victim_state)
    @state == victim_state
    #board asks self state
    #compares to state of attacking piece
    #if self.state != attacking_piece.state
    #return true
  end

end

# test_piece = Piece.new([0,0], "black", [1,0])
# p test_piece.move(1,0)
