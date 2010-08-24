class Timerator

  TIME_SPANS = {
    :second => 1,
    :minute => 60,
    :hour => 3600,
    :day => 86_400,
    :week => 604_800
  }

  def initialize start_date = Time.now, end_date = Time.now, inclusive = false
    @start_date = start_date
    @end_date = end_date
    @inclusive = inclusive
  end

  def slice period = :second
    diff = (@end_date - @start_date) - inclusive_modifier

    diff /= TIME_SPANS[period]

    (0..diff).map do |tick|
      span_start = @start_date + TIME_SPANS[period] * tick
      span_end = @start_date + TIME_SPANS[period] * (tick + 1)
      (span_start..[span_end,@end_date].min)
    end
  end

  private

  def inclusive_modifier
    @inclusive ? 0 : 1
  end
end
