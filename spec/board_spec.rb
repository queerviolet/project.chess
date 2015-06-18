require_relative '../board'

describe 'a board' do
  let (:board) { Chess::Board.new }

  it 'starts with 32 pieces, 16 black, 16 white' do
    expect(board.pieces.length).to equal(32)
    expect(board.pieces.count { |k, w| w.color == :white }).to equal(16)
    expect(board.pieces.count { |k, b| b.color == :black }).to equal(16)
  end

  it 'has a width and height of 8' do
    expect(board.width).to equal(8)
    expect(board.height).to equal(8)
  end

  it 'returns squares when indexed with []' do
    expect(board[0, 0]).to be_a Chess::Square
  end
end