class BestCombinationFinder
  attr_reader :quality_measure
  def initialize(quality_measure)
    @quality_measure = quality_measure
  end

  def combinations(elements)
    elements.map {|es| es.max_by(&quality_measure)}
  end
end