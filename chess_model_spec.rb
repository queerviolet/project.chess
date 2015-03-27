require_relative "chess_model"

describe "Board" do
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
			args = {color: "white", position: [1,0]}
			chess_board.place(Pawn.new(args), [5,0])
			expect(chess_board.board[5][0].is_a?(Pawn)).to eq true
		end
	end

	describe "place" do
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
