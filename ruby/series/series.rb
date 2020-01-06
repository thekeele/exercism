class Series
  def initialize(series)
    @series = series.chars
  end

  def slices(number)
    slices = []
    series = @series.map(&:dup)

    raise ArgumentError unless number <= series.length

    series.length.times do
      if series.length >= number
        slices.push(series.take(number))
        series.shift
      end
    end

    slices.map(&:join)
  end
end
