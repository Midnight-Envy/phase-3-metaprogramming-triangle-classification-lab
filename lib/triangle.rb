class Triangle
  class TriangleError < StandardError
  end

  def initialize(side_one, side_two, side_three)
    @sides = [side_one, side_two, side_three]
  end

  def kind
    raise TriangleError unless valid?

    if @sides.uniq.length == 1
      :equilateral
    elsif @sides.uniq.length == 2
      :isosceles
    else
      :scalene
    end
  end

private

  def valid?
    @sides.all? { |side| side > 0 } &&
      @sides.sort[0] + @sides.sort[1] > @sides.sort[2]
  end
end
