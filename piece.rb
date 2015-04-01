require 'matrix'

require_relative './move'

module Chess
  class Piece
    SYMBOLS = {}
  
    def self.symbols(symbols)
      self.const_set(:SYMBOLS, symbols)
      symbols.each do |color, symbol|
        Chess::Piece::SYMBOLS[symbol.to_sym] = [self, color]
        Chess::Piece::SYMBOLS[symbol.to_s] = [self, color]
      end
    end
  
    def self.[](symbol)
      type, color = SYMBOLS[symbol]    
      return nil unless type
      type.new(color)
    end
  
    attr_reader :color
    attr_accessor :square
  
    def initialize(color, square=nil)
      @color, @square = color, square
    end
  
    def symbol
      self.class::SYMBOLS[color]
    end
  
    def to_s
      "#{symbol}#{square}"
    end
  
    def name
      self.class.to_s.split('::').last.downcase
    end

    def describe
      "#{color} #{name} #{to_s}"
    end
  
    def white?
      color == :white
    end
  
    def black?
      color == :black
    end
  
    def opposite
      white?? :black : :white
    end
  
    NORTH, SOUTH = Vector[-1, 0], Vector[1, 0]
    EAST, WEST = Vector[0, 1], Vector[0, -1]
    NORTHEAST, NORTHWEST = NORTH + EAST, NORTH + WEST
    SOUTHEAST, SOUTHWEST = SOUTH + EAST, SOUTH + WEST
  
    def ride(vec, **opts)
      min = opts[:min] || 1
      max = opts[:max] || (1.0 / 0.0) # infinity
      capture = opts[:capture].nil?? true : opts[:capture]
      description = opts[:description]
      steps = []
      (min..max).each do |step|
        sq = square + step * vec
        break unless sq.valid?
        break unless sq.empty? or capture && sq.piece.color == opposite
        steps << Chess::Move.new(piece: self,
          from: square, to: sq,
          captures: capture ? [sq] : [],
          description: description)
        break if sq.piece && sq.piece.color == opposite
      end
      steps
    end
  
    def moves
      []
    end

    def move!(move)
      move.captures.each { |sq| sq.die! }
      square.piece = nil
      self.square = move.to
      square.piece = self
    end
  end
  
  class Pawn < Chess::Piece
    symbols white: '♙', black: '♟'
    attr_reader :last_move
  
    def initialize(*args)
      super
      @last_move = nil
    end
  
    def moves
      step = black?? SOUTH : NORTH
      basic = ride(step, max: 1, capture: false)
      stabby = [step + EAST, step + WEST].map do |stab|
        square + stab
      end.reject { |sq| sq.empty? || sq.piece.color == color }
      advance = []
      unless @last_move
        advance = ride(step * 2, max: 1, capture: false, description: 'advance')
      end
      basic + advance + stabby
    end
  end
  
  class Rook < Chess::Piece
    symbols white: '♖', black: '♜'
  
    def moves
      [NORTH, SOUTH, EAST, WEST].flat_map(&method(:ride))
    end
  end
  
  class Knight < Chess::Piece
    symbols white: '♘', black: '♞'
  end
  
  class Bishop < Chess::Piece
    symbols white: '♗', black: '♝'
  
    def moves
      [NORTHEAST, NORTHWEST,
       SOUTHEAST, SOUTHWEST].flat_map(&method(:ride))
    end
  end
  
  class Queen < Chess::Piece
    symbols white: '♕', black: '♛'
  
    def moves
      [NORTH, SOUTH, EAST, WEST,
       NORTHEAST, NORTHWEST,
       SOUTHEAST, SOUTHWEST].flat_map(&method(:ride))
    end
  end
  
  class King < Chess::Piece
    symbols white: '♔', black: '♚'
  
    def moves
      [NORTH, SOUTH, EAST, WEST,
       NORTHEAST, NORTHWEST,
       SOUTHEAST, SOUTHWEST].flat_map do |vec|
        ride(vec, max: 1)
      end
    end
  end
end