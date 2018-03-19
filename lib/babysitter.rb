module Babysitter
  def self.calculate(start_time, end_time, bed_time)
    12 * (end_time - start_time) / 3600
  end
end
