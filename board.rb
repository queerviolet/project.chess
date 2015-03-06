#!/usr/bin/env ruby

require_relative './piece'

class Chessboard
  attr_reader :pieces, :width, :height

  CLASSIC_LAYOUT = [
      [:♜, :♞, :♝, :♛, :♚, :♝, :♞, :♜,],
      [:♟, :♟, :♟, :♟, :♟, :♟, :♟, :♟,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:♙, :♙, :♙, :♙, :♙, :♙, :♙, :♙,],
      [:♖, :♘, :♗, :♕, :♔, :♗, :♘, :♖,],
    ]

  def self.classic
    self[CLASSIC_LAYOUT]
  end

  # layout is like STD_LAYOUT
  def self.[](layout)
    height = layout.length
    width = layout[0].length
    pieces = {}
    layout.each_with_index do |row, row_idx|
      row.each_with_index do |sym, col_idx|
        if piece = Chesspiece[sym]
          pieces[[row_idx, col_idx]] = piece
        end
      end
    end
    new(width, height, pieces)
  end

  # pieces is a hash of {[row:(0..7), col:(0..7)] => Chesspiece}
  def initialize(width=8, height=8, pieces=classic.pieces)
    @width, @height, @pieces = width, height, pieces
    pieces.each { |pos, piece| piece.square = self[*pos] }
  end

  def [](row, col)
    ChessSquare.new(self, row, col)
  end

  def to_s
    (0..height - 1).map do |r|
      (0..width - 1).map do |c|
        if self[r, c].piece
          " #{self[r, c].piece.symbol} "
        else
          "   "
        end
      end.join
    end.join("\n")
  end
end

class ChessSquare
  attr_reader :board, :row, :col
  def initialize(board, row, col)
    @board, @row, @col = board, row, col
  end

  def valid?
    row > 0 && row < board.height && col > 0 && col < board.width
  end

  def piece
    board.pieces[[row, col]]
  end

  def empty?
    piece == nil
  end

  def +((dr, dc))
    board[row + dr, col + dc]
  end

  def to_s
    "#{('a'..'z').to_a[row]}#{board.height - col}"
  end
end

if __FILE__ == $0
  puts Chessboard.classic
  puts Chessboard.classic[0,0]
end