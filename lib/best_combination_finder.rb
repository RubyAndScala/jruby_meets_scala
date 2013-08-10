class BestCombinationFinder
  attr_reader :quality_measure
  def initialize(quality_measure)
    @quality_measure = quality_measure
  end

  def combinations(elements)
    Combinations.new(quality_measure, elements)
  end

  class Combinations
    include Enumerable
    attr_reader :quality_measure, :elements
    def initialize(quality_measure, elements)
      @quality_measure = quality_measure
      @elements = elements
    end

    def each(*args, &blk)
      combinations = if elements.empty?
        [[]]
      else
        first, *rest = elements
        first.product(*rest)
      end
      combinations.each(*args, &blk)
    end

    def all
      to_a
    end

    def best
      max_by(&quality_measure)
    end

    def eql?(other)
      to_a.eql?(other)
    end

    def ==(other)
      to_a == other
    end
  end
end