class Babysitter
  attr_reader :start_time, :end_time, :bedtime

  def initialize(start_time, end_time, bedtime)
    @start_time = start_time
    @end_time   = end_time
    @bedtime    = bedtime

    raise_if_invalid!
  end

  def calculate_pay
    [
      12 * hours_worked_before_bedtime,
      8  * hours_worked_after_bedtime_before_midnight,
      16 * hours_worked_after_midnight
    ].reduce(:+)
  end

  private
  def hours_worked_before_bedtime
    return 0 if start_time >= bedtime

    stop = [end_time, bedtime].min

    hours_difference(start_time, stop)
  end

  def hours_worked_after_bedtime_before_midnight
    return 0 if start_time >= midnight || end_time <= bedtime

    start = [start_time, bedtime].max
    stop  = [midnight, end_time].min

    hours_difference(start, stop)
  end

  def hours_worked_after_midnight
    return 0 unless end_time > midnight

    start = [midnight, start_time].max

    hours_difference(start, end_time)
  end

  def midnight
    if (17..23).include? start_time.hour
      Time.new(start_time.year, start_time.month, start_time.day + 1)
    else
      Time.new(start_time.year, start_time.month, start_time.day)
    end
  end

  def hours_difference(start, stop)
    (stop - start) / 3600
  end

  def raise_if_invalid!
    if (5..16).include? start_time.hour
      raise "start_time must be between 5:00 PM and 4:00 AM"
    elsif (5..16).include? end_time.hour
      raise "end_time must be between 5:00 PM and 4:00 AM"
    end
  end
end
