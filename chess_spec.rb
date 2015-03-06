#rspec for Chess.rb
require_relative 'chess.rb'

describe 'Board' do
  let (:board) { Board.new }

  it 'starts with 32 pieces, 16 black, 16 white' do
    expect(board.pieces.length).to equal (32)
    expect(board.pieces.count { |piece| piece.color == :white }).to equal(16)
    expect(board.pieces.count { |piece| piece.color == :black }).to equal(16)
  end

  it 'has a width and height of 8' do
    expect(board.width).to equal(8)
    expect(board.height).to equal(8)
  end

  it 'has a clear method which removes all pieces' do
    board.clear
    expect(board.pieces.empty?).to equal(true)
  end

  it 'has thirty-two empty slots that are equal to nil' do
    expect(board.pieces.empty?).to equal(32)
  end
end

describe 'Rook' do
  let (:rook) { Rook.new({7 => 7}, "black") }

  it 'starts position and color' do
    expect(rook.color).to eq("black")
  end
end
