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
    12 * (@stop - @start)
  end
end
