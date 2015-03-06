class Piece
  def initialize(location, state, move_pattern, args)
    @location = location
    @state = state
    @move_pattern = move_pattern
    @capture_pattern = args.fetch(:capture_pattern, move_pattern)
    @can_jump = args.fetch(:can_jump, false)
    @can_reverse = args.fetch(:can_reverse, true)
  end

  def move(row,col)
    if @move_pattern == [@location[0] - row, @location[1] - col].abs
      return [row,col]
    end
    return @location
  end

end


