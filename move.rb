module Chess
  class Move
    attr_reader :piece, :from, :to, :captures
    attr_accessor :description

    def initialize(params={})
      @piece, @from, @to, @captures, @description = params.values_at(
        :piece,
        :from,
        :to,
        :captures,
        :description)
    end

    def make!
      piece.move!(self)
    end

    def to_s(opts={})
      fmt_piece = opts[:fmt_piece] || :describe

      taken = captures
        .map { |sq| sq.piece && sq.piece.send(fmt_piece) }
        .compact
      taken_s = taken.empty?? nil : ("captures #{taken.join(', ')}")
      info = [description, taken_s].compact.join('; ')
      info = "(#{info})" unless info == ''
      "#{piece.send(fmt_piece)} to #{to} #{info}"
    end
  end
end