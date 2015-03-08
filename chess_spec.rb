#rspec for Chess.rb
require_relative 'chess.rb'

describe 'Board' do
  let (:board) { Board.new }

  it 'starts with 32 pieces, 16 black, 16 white' do
    expect(board.pieces.count).to equal (32)
  end

  it 'has a width and height of 8' do
    expect(board.width).to equal(8)
    expect(board.height).to equal(8)
  end

  it 'Expects an empty space to equal nil' do
    expect(board.find_piece([5, 5]) ).to equal(nil)
  end

  describe 'find_piece' do
    it 'should return the color of the object' do
      expect(board.find_piece([0,0]).color).to eq(:black)
    end
  end

  describe 'check_path' do
    it "should return an array" do
      expect(board.check_path([0,0], [0,7])).to eq([[0, 0], [0, 1], [0, 2], [0, 3], [0, 4], [0, 5], [0, 6], [0, 7]])
    end
  end
end
#
describe 'Rook' do
  let (:rook) { Rook.new(:black) }

  it 'is black' do
    expect(rook.color).to eq(:black)
  end
end

describe 'Knight' do
  let (:knight) { Knight.new(:white) }

  it 'is white' do
    expect(knight.color).to eq(:white)
  end
end

describe 'Bishop' do
  let (:bishop) { Bishop.new(:black) }

  it 'is black' do
    expect(bishop.color).to eq(:black)
  end

end

describe 'King' do
  let (:king) { King.new(:white) }

  it 'is color' do
    expect(king.color).to eq(:white)
  end
end

describe 'Queen' do
  let (:queen) { Queen.new(:white) }

  it 'is color' do
    expect(queen.color).to eq(:white)
  end
end

describe 'Pawn' do
  let (:pawn) { Pawn.new(:black) }

  it 'starts position and color' do
    expect(pawn.color).to eq(:black)
  end
end

describe 'Pawn' do
  let (:pawn) { Pawn.new(:white) }

  it 'starts position and color' do
    expect(pawn.color).to eq(:white)
  end
end


