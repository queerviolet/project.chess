require_relative "chess_model"

describe "Board" do
	let(:board) {Board.new}
	describe "initialize" do
		it "should initialize to nil" do
			board.board.each do |row|
				row.each do |space|
					expect(space).to eq nil
				end
			end
		end
	end

	describe "initialize_white_pieces" do
		it "should create an array of white piece objects" do

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
