#rspec for Chess.rb
require_relative 'chess.rb'

describe 'Board' do
  let (:board) { Board.new }

  it 'starts with 64 pieces, 32 black, 32 white' do
    expect(board.pieces.length).to equal (64)
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

  it 'has valid? method which returns true' do
    expect(rook.valid?({ 6=>7 })).to eq(true)
  end

  it 'has valid? method which returns false' do
    expect(rook.valid?({ 6=>6 })).to eq(false)
  end
end

describe 'Knight' do
  let (:knight) { Knight.new({1 => 0}, "white") }

  it 'starts position and color' do
    expect(knight.color).to eq("white")
  end

  it 'has valid? method which returns true' do
    expect(knight.valid?({ 2 => 2 })).to eq(true)
  end

  it 'has valid? method which returns false' do
    expect(knight.valid?({ 2 => 3 })).to eq(false)
  end
end

describe 'Bishop' do
  let (:bishop) { Bishop.new({5 => 7}, "black") }

  it 'starts position and color' do
    expect(bishop.color).to eq("black")
  end

  it 'has valid? method which returns true' do
    expect(bishop.valid?({ 6=>6 })).to eq(true)
  end

  it 'has valid? method which returns false' do
    expect(bishop.valid?({ 6=>5 })).to eq(false)
  end
end

describe 'King' do
  let (:king) { King.new({4 => 0}, "white") }

  it 'starts position and color' do
    expect(king.color).to eq("white")
  end

  it 'has valid? method which returns true' do
    expect(king.valid?({ 4=>1 })).to eq(true)
  end

  it 'has valid? method which returns false' do
    expect(king.valid?({ 4=>2 })).to eq(false)
  end
end

describe 'Queen' do
  let (:queen) { Queen.new({3 => 0}, "white") }

  it 'starts position and color' do
    expect(queen.color).to eq("white")
  end

  it 'has valid? method which returns true' do
    expect(queen.valid?({ 3=>5 })).to eq(true)
  end

  it 'has valid? method which returns false' do
    expect(queen.valid?({ 4=>2 })).to eq(false)
  end
end

describe 'Pawn' do
  let (:pawn) { Pawn.new({4 => 6}, "black") }

  it 'starts position and color' do
    expect(pawn.color).to eq("black")
  end

  it 'has valid? method which returns true' do
    expect(pawn.valid?({ 4 => 5 })).to eq(true)
  end

#why does the black pawn return nil?
  it 'has valid? method which returns false' do
    expect(pawn.valid?({ 5 => 6 })).to eq(false)
  end
end

describe 'Pawn' do
  let (:pawn) { Pawn.new({7 => 1}, "white") }

  it 'starts position and color' do
    expect(pawn.color).to eq("white")
  end

  it 'has valid? method which returns true' do
    expect(pawn.valid?({ 7 => 2 })).to eq(true)
  end

  it 'has valid? method which returns false' do
    expect(pawn.valid?({ 6 => 5 })).to eq(false)
  end
end


