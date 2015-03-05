require_relative 'chess'

# Coordinates is an array [Column, Row]



describe 'Piece' do

  # notes on passing a option argument
  # class Piece
  #   def initialize(location, state, move_pattern, args)
  #     ...
  #     @capture_pattern = args.fetch(:capture_pattern, move_pattern)
  #     @can_jump = args.fetch(:can_jump, false)
  #     @can_reverse = args.fetch(:can_reverse, true)
  #   end
  # end

  let(:white_piece1) { Piece.new([0,0], 'white', [] }
  let(:white_piece2) { Piece.new([0,1], 'white', [] }
  let(:black_piece1) { Piece.new([7,0], 'black', [] }
  #input:
  #  location - this is where the piece is set originally
  #  state - what colour is this piece
  #  move_pattern - is an array of (dy, dx) coordinates
  # option arguments
  #  :capture_pattern - is an array of (dy, dx) corrdinates, by default it is move_pattern
  #  :can_jump - a boolean saying if the piece can jump, by default it is false
  #  :can_reverse - a bollean saying if the piece can go reverse, by default it is true
  describe '#initialize' do
    it 'is a Piece class' do
      expect()
    end
  end

  describe '#move' do
    it 'is defined' do
      expect(Piece.method_defined?(:move)).to eq(true)
    end

    # the argument is an array of the possible location of the piece
    it 'has one argument' do
      expect(Piece.instance_method(:move).arity).to eq(1)
    end
  end

  # this is for the victim piece that may or may not be attacked
  describe '#capturable?' do
    it 'is defined' do
      expect(Piece.method_defined?(:capturable?)).to eq(true)
    end

    # argument is the attacker's state on the victim piece
    it 'has one argument' do
        expect(Piece.instance_method(:capturable?)).to eq(1)
    end
  end
end

# Column are a - h
# Rows are 0 - 7

describe 'Board' do

end
