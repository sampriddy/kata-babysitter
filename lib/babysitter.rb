class Babysitter
  # Start, stop, and bed are expected to be strings of the format
  # "#{integer} {AM/PM}", i.e "5 PM", "3 AM", and so on.

  def initialize(start, stop, bed)
    @start, @stop, @bed = [start, stop, bed].map {|str| parse_timestring(str)}
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

  def parse_timestring(str)
    initial_integer, period = str.split

    case period
    when "AM" then initial_integer.to_i + 24
    when "PM" then initial_integer.to_i + 12
    end
  end
end
