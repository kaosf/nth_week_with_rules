# NthWeekWithRules

Calculate n-th week of the date with some rules.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'nth_week_with_rules'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install nth_week_with_rules

## Usage

```ruby
require 'nth_week_with_rules'

date = Date.new(2016, 4, 1)

date.nth_week #=> 1 (means 1st week of 2016-04)

date.nth_week(month_select: before) #=> 5 (means 5th week of 2016-03)
# :before option makes the method to take a before month
# if the week is over 2 months.

date = Date.new(2016, 3, 31)

date.nth_week(month_select: :after) #=> 1 (means 1st week of 2016-04)
# :after option makes the method to take a after month
# if the week is over 2 months.

date = Date.new(2016, 9, 1)

date.nth_week(month_select: :many) #=> 5 (means 5th week of 2016-08)
# :many option makes the method to take a month which has many days.
# 2016-08-28, 2016-08-29, 2016-08-30, 2016-08-31: 4 days
# 2016-09-01, 2016-09-02, 2016-09-03:             3 days

date = Date.new(2016, 4, 30)

date.nth_week(first_wday: 6) #=> 6 (means 6th week of 2016-04)
# Do all calculations on the calendar that Saturday is the first wday.
# If the first wday of a calendar is Saturday, 2016-04 becomes below:
#
# Sa Su Mo Tu We Th Fr
#                    1
#  2  3  4  5  6  7  8
#  9 10 11 12 13 14 15
# 16 17 18 19 20 21 22
# 23 24 25 26 27 28 29
# 30
#
# So 2016-04-01 is the 6th week of 2016-04.

date = Date.new(2016, 4, 1)
date.nth_week          #=> 1
date.nth_week(base: 0) #=> 0
# You can get 0 base indices. The default base is 1.
```

Of cource you can use a complex rule.

```ruby
date = Date.new(2016, 4, 1)
date.nth_week(first_wday: 3, month_select: :before, base: 0) #=> 5
```

...Is it really correct? Yes!

```
# Start from Wednesday (wday 3)
#
#      March 2016
# We Th Fr Sa Su Mo Tu
#                    1  0th (start from 0th because of base 0 specification)
#  2  3  4  5  6  7  8  1st
#  9 10 11 12 13 14 15  2nd
# 16 17 18 19 20 21 22  3rd
# 23 24 25 26 27 28 29  4th
# 30 31                 5th
#
#      April 2016
# We Th Fr Sa Su Mo Tu
#        1  2  3  4  5  0th (2016-04-01 is here! And select_month is :before)
#  6  7  8  9 10 11 12  1st
# 13 14 15 16 17 18 19  ...
# 20 21 22 23 24 25 26
# 27 28 29 30
```

So, 2016-04-01 is the 5th week of 2016-03.

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/kaosf/nth_week_with_rules.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

Copyright (C) 2016-2023 ka
