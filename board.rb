#!/usr/bin/env ruby

require 'matrix'

require_relative './piece'

class Chessboard
  attr_reader :pieces, :width, :height

  # Board layouts
  CLASSIC = [
      [:♜, :♞, :♝, :♛, :♚, :♝, :♞, :♜,],
      [:♟, :♟, :♟, :♟, :♟, :♟, :♟, :♟,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:_, :_, :_, :_, :_, :_, :_, :_,],
      [:♙, :♙, :♙, :♙, :♙, :♙, :♙, :♙,],
      [:♖, :♘, :♗, :♕, :♔, :♗, :♘, :♖,],
    ]

  # layout is in the format of CLASSIC
  def self.[](layout)
    new(width, height, layout_to_pieces(layout))
  end

  def self.classic
    self[CLASSIC]
  end

  # layout is a nested array like CLASSIC, returns
  # a hash of {[row:(0..7), col:(0..7)] => Chesspiece}
  def self.layout_to_pieces(layout)
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
    pieces
  end

  # pieces is a hash of {[row:(0..7), col:(0..7)] => Chesspiece}
  def initialize(width=8, height=8, pieces=nil)
    pieces = pieces || Chessboard.layout_to_pieces(CLASSIC)
    @width, @height, @pieces = width, height, pieces
    pieces.each { |pos, piece| piece.square = self[*pos] }
  end

  def [](row_or_str, col=nil)
    return ChessSquare.parse(self, row_or_str.to_s) unless col
    ChessSquare.new(self, [row_or_str, col])
  end

  def to_s(opts={})
    axes = opts[:axes].nil?? false : opts[:axes]
    unlabeled = (0..height - 1).map do |r|
      (0..width - 1).map do |c|
        label = (axes && c == 0)? self[r, c].alg_row_s : ''
        if self[r, c].piece
          label + " #{self[r, c].piece.symbol} "
        else
          label + "   "
        end
      end.join
    end.join("\n")
    return unlabeled unless axes
    col_labels = (0..width - 1).map { |c| " #{self[0, c].alg_col_s} " }.join
    unlabeled + "\n " + col_labels
  end
end

class ChessSquare
  def self.parse(board, algebraic)
    match = /([a-z])\s*([0-9]+)/.match(algebraic.strip)
    unless match
      raise Exception.new("Invalid algebraic: #{algebraic}") 
    end
    col = match[1].bytes[0] - 'a'.bytes[0]
    row = board.height - match[2].to_i
    new(board, [row, col])
  end

  attr_reader :board, :pos

  def initialize(board, pos)
    @board, @pos = board, Vector[*pos]
  end

  def valid?
    row >= 0 && row < board.height && col >= 0 && col < board.width
  end

  def piece
    board.pieces[[row, col]]
  end

  def empty?
    piece == nil
  end

  def die!
    if piece
      piece.square = nil
      board.pieces.delete([row ,col])
    end
  end

  def +(vec)
    board[*(pos + vec)]
  end

  def row
    pos[0]
  end

  def col
    pos[1]
  end

  def alg_col_s
    "#{('a'..'z').to_a[col]}"
  end

  def alg_row_s
    "#{board.height - row}"
  end

  def to_s
    alg_col_s + alg_row_s
  end

  def ==(other)
    pos == other.pos && board == other.board
  end

  def threatened
    board.pieces.values.flat_map(&:moves).select do |move|
      move[:capture] == self
    end
  end
end

if __FILE__ == $0
  board = Chessboard.classic  
  puts board.to_s(axes: true)
  puts "a8:"
  board[:a8].piece.moves.each { |m| puts m[:to] }
  puts "a7:"
  board[:a7].piece.moves.each { |m| puts m[:to] }
  board[:a7].die!
  puts "a8 after a7 death:"
  board[:a8].piece.moves.each { |m| puts m[:to] }
  puts "threatening #{board[:a3]}:"
  board[:a3].threatened.each { |t| puts t[:piece].describe }
  puts "threatening: #{board[:b4]}"
  board[:b4].threatened.each { |t| puts t[:piece].describe }
end