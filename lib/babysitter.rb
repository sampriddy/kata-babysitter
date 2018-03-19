class Babysitter
  attr_reader :start_time, :end_time, :bedtime, :midnight

  def initialize(start_time, end_time, bedtime)
    @start_time = start_time
    @end_time   = end_time
    @bedtime    = bedtime
  end

  def calculate_pay
    [
      12 * hours_worked_before_bedtime,
      8  * hours_worked_after_bedtime_before_midnight
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

  def midnight
    Time.new(start_time.year, start_time.month, start_time.day + 1)
  end

  def hours_difference(start, stop)
    (stop - start) / 3600
  end
end
