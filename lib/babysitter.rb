class Babysitter
  # Start, stop, and bed are all expected to be integers representing hours
  # in military time. Therefore 17 to 23 are 5:00PM to 11:00PM, and 0 to 4
  # are 12:00AM to 4:00AM on the next day.
  def initialize(start, stop, bed)
    @start, @stop, @bed =
      [start, stop, bed].map do |hour|
        (0..4).include?(hour) ? hour + 24 : hour
      end
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
    return 0 unless @start < @bed

    hours_difference(@start, [@stop, @bed].min)
  end

  def hours_between_bedtime_and_midnight
    return 0 if @start >= 24 || @stop <= @bed

    start_time = [@bed, @start].max
    stop_time  = [24, @stop].min

    hours_difference(start_time, stop_time)
  end

  def hours_after_midnight
    start_time = [24, @start].max
    hours_difference(start_time, @stop)
  end

  def hours_difference(start, stop)
    [stop - start, 0].max
  end
end
