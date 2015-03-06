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

  let(:white_piece1) { Piece.new([0,0], 'white', [1,0]) }
  let(:white_piece2) { Piece.new([0,1], 'white', []) }
  let(:black_piece1) { Piece.new([7,0], 'black', []) }
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
    #changed format of argument for Board methods that handle
    #cell location from array to 2 integer parameters
    it 'can move to new coordinates' do
      expect(white_piece1.move(1,0)).to eq(1,0)
    end

    it 'cannot move to new coordinates' do
      expect(white_piece1.move(9,9)).to eq(0,0)
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

    it 'is getting captured' do
      expect(white_piece1.capturable?('black')).to eq(true)
    end

    it 'is not getting captured' do
      expect(white_piece1.capturable?('white')).to eq(false)
    end
  end
end

describe 'Pawn' do

  let(:pawn_piece) { Pawn.new([5,0], 'white') }

  describe '#move' do
    it "can't move backwards" do
      expect(pawn_piece.move(4,0).to eq(5,0)
    end

end


# Column are a - h
# Rows are 0 - 7

describe 'Board' do

  let(:new_board) { Board.new }
  describe '#initialize' do
    it 'is a nested array of eight sub-arrays, each with eight elements' do
      #TODO: create board attribute reader which is the board as 2d array
      expect(new_board.board.length).to eq(8)
      new_board.board.each {|row| expect(row.length).to eq(8)}
    end
  end

  describe '#cell_empty?' do
    it "is defined" do
      expect(Board.method_defined?(:cell_empty?)).to eq(true)
    end

    it "has one argument" do
      expect(Board.instance_method(:cell_empty?).arity).to eq(1)
    end

    it "returns false when a piece is there" do
      expect(new_board.cell_empty?(0,0)).to eq(false)
    end

    it "returns true when a piece is not there" do
      expect(new_board.cell_empty?(2,0)).to eq(true)
    end

  end

    describe '#remove' do
      it "has one argument" do
      expect(Board.instance_method(:remove).arity).to eq(1)
      end

      it "changes a filled cell to an empty cell" do
        expect(new_board.remove(0,5)).to eq(" "))

        describe
    end



  end

end

# TODO: logic of capture
