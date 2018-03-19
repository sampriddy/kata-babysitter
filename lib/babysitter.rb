class Babysitter
  # Start, stop, and bed are all expected to be integers representing hours
  # in military time. Therefore 17 to 23 are 5:00PM to 11:00PM, and 0 to 4
  # are 12:00AM to 4:00AM on the next day.
  def initialize(start, stop, bed)
    @start = start
    @stop = stop
    @bed = bed
  end

  def calculate_wages
    [
      12 * hours_before_bedtime,
      8 * hours_between_bedtime_and_midnight,
      16 * hours_after_midnight
    ].reduce(:+)
  end

  private
  def hours_before_bedtime
    return 0 unless (17...@bed).include?(@start)

    res = [@stop, @bed].min - @start
    res >= 0 ? res : 0
  end

  def hours_between_bedtime_and_midnight
    return 0 if (0..4).include?(@start) || (17..@bed).include?(@stop)

    res = [24, @stop].min - [@bed, @start].max
    res >= 0 ? res : 0
  end

  def hours_after_midnight
    return 0 unless (1..4).include?(@stop)

    res = @stop - [0, @start].max
    res >= 0 ? res : 0
  end
end
