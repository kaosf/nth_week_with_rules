require 'test_helper'
require 'nth_week_with_rules'

class TestNthWeekWithRules < Test::Unit::TestCase
  data(
    "2016-04-01" => [Date.new(2016,  4,  1), 1],
    "2016-04-02" => [Date.new(2016,  4,  2), 1],
    "2016-04-03" => [Date.new(2016,  4,  3), 2],
    "2016-04-11" => [Date.new(2016,  4, 11), 3],
    "2016-04-18" => [Date.new(2016,  4, 18), 4],
    "2016-04-25" => [Date.new(2016,  4, 25), 5],
    "2016-04-30" => [Date.new(2016,  4, 30), 5],
    "2016-05-01" => [Date.new(2016,  5,  1), 1],
    "2016-05-31" => [Date.new(2016,  5, 31), 5])
  test "#nth_week" do |(date, nth)|
    assert { date.nth_week == nth }
  end


  data(
    "2016-04-01 1" => 1,
    "2016-04-01 2" => 2,
    "2016-04-01 3" => 3,
    "2016-04-01 4" => 4,
    "2016-04-01 5" => 5,
    "2016-04-01 6" => 6)
  test "#nth_week with first_wday" do |first_wday|
    assert { Date.new(2016, 4, 1).nth_week(first_wday: first_wday) == 1 }
  end

  data(
    "2016-04-01 0 :before" => [0, :before, 5],
    "2016-04-01 0 :after"  => [0, :after,  1],
    "2016-04-01 0 :many"   => [0, :many,   5],
    "2016-04-01 1 :before" => [1, :before, 5],
    "2016-04-01 1 :after"  => [1, :after,  1],
    "2016-04-01 1 :many"   => [1, :many,   5],
    "2016-04-01 2 :before" => [2, :before, 5],
    "2016-04-01 2 :after"  => [2, :after,  1],
    "2016-04-01 2 :many"   => [2, :many,   1],
    "2016-04-01 3 :before" => [3, :before, 6],
    "2016-04-01 3 :after"  => [3, :after,  1],
    "2016-04-01 3 :many"   => [3, :many,   1],
    "2016-04-01 4 :before" => [4, :before, 6],
    "2016-04-01 4 :after"  => [4, :after,  1],
    "2016-04-01 4 :many"   => [4, :many,   1],
    "2016-04-01 5 :before" => [5, :before, 1],
    "2016-04-01 5 :after"  => [5, :after,  1],
    "2016-04-01 5 :many"   => [5, :many,   1],
    "2016-04-01 6 :before" => [6, :before, 5],
    "2016-04-01 6 :after"  => [6, :after,  1],
    "2016-04-01 6 :many"   => [6, :many,   5])
  test "#nth_week with first_wday and select_month" do |(first_wday, month_select, nth)|
    assert { Date.new(2016, 4, 1).nth_week(first_wday: first_wday, month_select: month_select) == nth }
  end

  data(
    "2016-04-02" => [Date.new(2016,  4,  2), 0],
    "2016-04-03" => [Date.new(2016,  4,  3), 1],
    "2016-04-11" => [Date.new(2016,  4, 11), 2],
    "2016-04-18" => [Date.new(2016,  4, 18), 3],
    "2016-04-25" => [Date.new(2016,  4, 25), 4])
  test "#nth_week with base 0" do |(date, nth)|
    assert { date.nth_week(base: 0) == nth }
  end

  data(
    "2016-04-01 0" => [Date.new(2016,  4,  1), 0, Date.new(2016,  3, 27)],
    "2016-04-03 0" => [Date.new(2016,  4,  3), 0, Date.new(2016,  4,  3)],
    "2016-04-04 0" => [Date.new(2016,  4,  4), 0, Date.new(2016,  4,  3)],
    "2016-04-05 0" => [Date.new(2016,  4,  5), 0, Date.new(2016,  4,  3)],
    "2016-04-06 0" => [Date.new(2016,  4,  6), 0, Date.new(2016,  4,  3)],
    "2016-04-07 0" => [Date.new(2016,  4,  7), 0, Date.new(2016,  4,  3)],
    "2016-04-08 0" => [Date.new(2016,  4,  8), 0, Date.new(2016,  4,  3)],
    "2016-04-09 0" => [Date.new(2016,  4,  9), 0, Date.new(2016,  4,  3)],
    "2016-04-24 0" => [Date.new(2016,  4, 24), 0, Date.new(2016,  4, 24)],
    "2016-04-30 0" => [Date.new(2016,  4, 30), 0, Date.new(2016,  4, 24)],
    "2016-05-01 0" => [Date.new(2016,  5,  1), 0, Date.new(2016,  5,  1)],
    "2016-05-31 0" => [Date.new(2016,  5, 31), 0, Date.new(2016,  5, 29)],
    "2016-06-01 0" => [Date.new(2016,  6,  1), 0, Date.new(2016,  5, 29)],
    "2016-04-01 1" => [Date.new(2016,  4,  1), 1, Date.new(2016,  3, 28)],
    "2016-04-01 2" => [Date.new(2016,  4,  1), 2, Date.new(2016,  3, 29)],
    "2016-04-01 3" => [Date.new(2016,  4,  1), 3, Date.new(2016,  3, 30)],
    "2016-04-01 4" => [Date.new(2016,  4,  1), 4, Date.new(2016,  3, 31)],
    "2016-04-01 5" => [Date.new(2016,  4,  1), 5, Date.new(2016,  4,  1)],
    "2016-04-01 6" => [Date.new(2016,  4,  1), 6, Date.new(2016,  3, 26)])
  test "#first_date_of_week" do |(date, first_wday, first_date)|
    assert { date.first_date_of_week(first_wday: first_wday) == first_date }
  end
end
