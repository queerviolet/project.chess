describe 'a board' do
  let (:board) { Board.new }

  it 'starts with 32 pieces, 16 black, 16 white' do
    expect(board.pieces.length).to equal(32)
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

  # TODO: We are assuming that Board.new initializes the chess board
  # correctly. Write a spec for that.

  describe 'has a moves method' do
    it 'which returns an empty array when called on an empty square' do
      board.clear
      expect(board.moves(:white, [0, 0])).to equal([])
    end

    it 'which returns an empty array when called on a piece of the wrong color' do
      # row 1, col 0 should be a white pawn
      expect(board.moves(:black, [1, 0])).to equal([])
    end

  end
end