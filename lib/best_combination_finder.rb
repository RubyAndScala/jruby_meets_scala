class BestCombinationFinder
  attr_reader :quality_measure
  def initialize(quality_measure)
    @quality_measure = quality_measure
  end

  def combinations(elements)
    return [] if elements.empty?
    first, *rest = elements
    product = first.product(*rest)
    product.max_by(&quality_measure)
  end
end