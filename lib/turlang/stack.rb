module Turlang
  class Stack
    attr_writer :values
    BLANK = :"_"

    def initialize
      @pointer = 0
      @values = []
    end

    def read
      return BLANK if @pointer < 0 || @pointer >= @values.count
      @values[@pointer].to_sym
    end

    def write(symbol)
      @values[@pointer] = symbol
    end

    def <<
      @pointer -= 1
    end

    def >>
      @pointer += 1
    end
  end
end
