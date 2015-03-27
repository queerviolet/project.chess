require_relative "chess_model"

describe "Board" do

  args = {color: "white", position: [1,0]}
  let(:pawn) {Pawn.new(args)}

  args = {color: "white", position: [2,0]}
  let(:king) {King.new(args)}

  args = {color: "white", position: [3,0]}
  let(:queen) {Queen.new(args)}

  args = {color: "white", position: [4,0]}
  let(:knight) {Knight.new(args)}

  args = {color: "white", position: [5,0]}
  let(:bishop) {Bishop.new(args)}

  args = {color: "white", position: [6,0]}
  let(:rook) {Rook.new(args)}


  let(:chess_board) {Board.new}


  describe "initialize" do
    it "should initialize to nil" do
      chess_board.board.each do |row|
        row.each do |space|
          expect(space).to eq nil
        end
      end
    end
  end

  describe "initialize_white_pieces" do
    it "should create an array of white piece objects" do
      chess_board.white_pieces_array do |piece|
        expect(piece.color).to eq "white"
      end
    end
  end

  describe "initialize_black_pieces" do
    it "should create an array of black piece objects" do
      chess_board.black_pieces_array do |piece|
        expect(piece.color).to eq "black"
      end
    end
  end

  describe "place" do
    it "should push a piece object into the board array corresponding to the piece's position" do
      chess_board.place(pawn, [5,0])
      expect(chess_board.board[5][0].is_a?(Pawn)).to eq true
    end
  end

  describe "place" do
    it "should update the position of the piece after placing it on the board" do
      chess_board.place(pawn, [7,7])
      expect(pawn.position).to eq [7,7]
    end
  end

  describe "pawn_move" do
    it "should return an array of moves for the pawn passed" do
      expect(chess_board.pawn_move(pawn)).to eq [[2,0],[3,0]]
    end
  end

    describe "king_move" do
    it "should return an array of moves for the king passed" do
      expect(chess_board.pawn_move(king)).to eq [[2,0],[3,0]]
    end
  end

  describe "knight_move" do
    it "should return an array of moves for the knight passed" do
      expect(chess_board.pawn_move(knight)).to eq [[2,0],[3,0]]
    end
  end

  describe "rqb_move" do
    it "should return an array of moves for the rook passed" do
      expect(chess_board.pawn_move(rook)).to eq [[2,0],[3,0]]
    end
  end

  describe "rqb_move" do
    it "should return an array of moves for the queen passed" do
      expect(chess_board.pawn_move(queen)).to eq [[2,0],[3,0]]
    end
  end

  describe "rqb_move" do
    it "should return an array of moves for the bishop passed" do
      expect(chess_board.pawn_move(bishop)).to eq [[2,0],[3,0]]
    end
  end
end

describe "Pawn" do

end

describe "Knight" do

end

describe "Bishop" do

end

describe "Queen" do

end

describe "King" do

end

describe "Rook" do

end
