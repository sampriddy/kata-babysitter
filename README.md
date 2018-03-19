# How to run
install ruby, then...

```
git clone https://github.com/sampriddy/kata-babysitter.git
cd kata-babysitter
gem install bundler
bundle install
bundle exec rspec
```

# Example usage

```ruby
(terminal, at project root)
irb

(irb)
load('./lib/babysitter.rb')
=> true
start = '5 PM'
stop  = '10 PM'
bed   = '9 PM'
Babysitter.new(start, stop, bed).calculate_wages
=> 56
```

# Babysitter Kata

## Background
This kata simulates a babysitter working and getting paid for one night.  The rules are pretty straight forward.

The babysitter:
- starts no earlier than 5:00PM
- leaves no later than 4:00AM
- gets paid $12/hour from start-time to bedtime
- gets paid $8/hour from bedtime to midnight
- gets paid $16/hour from midnight to end of job
- gets paid for full hours (no fractional hours)


## Feature
*As a babysitter<br>
In order to get paid for 1 night of work<br>
I want to calculate my nightly charge<br>*
