## Design thoughts
We need to take into account the start-time, end-time, and bedtime. All of
these are variables that will affect the pay at end of day.

We are not concerned with fractional hours but what if she works from, say,
5:45PM to 6:45PM? Is that $0 or $12? As an initial assumption, I am assuming
that the start-time and end-time will only be whole hours.

Known constraints: start-time before 5:00PM is invalid, end-time after 4:00AM on
the next day is also invalid. The class should refuse to calculate the wage if
constraints are violated.

Additional assumption: bedtime cannot be after midnight. If it could, it would
be ambiguous whether the pay is $8/hour or $16/hour.
