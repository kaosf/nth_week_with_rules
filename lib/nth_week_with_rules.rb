# frozen_string_literal: true

require "nth_week_with_rules/version"

# Additional features module to be included in `Date` class
module NthWeekWithRules
  class InvalidMonthSelectError < StandardError; end

  # @param [Integer] first_wday 0, 1, 2, 3, 4, 5 or 6 (default is 0)
  # @param [Symbol] month_select :normal, :before, :after, :many (default is :normal)
  # @param [Integer] base 0 or 1 (default is 1)
  # @return [Integer] An integer from 1 to 6 (from 0 to 5 if **base** is 0)
  def nth_week(first_wday: 0, month_select: :normal, base: 1)
    start_date = first_date_of_week(first_wday: first_wday)
    end_date = start_date + 7

    week = (start_date.day + 5) / 7
    case month_select
    when :normal
      week = 0 if start_date.month != end_date.month && month == end_date.month
    when :before
      # Do nothing
    when :after
      week = 0 if start_date.month != end_date.month
    when :many
      middle_date = start_date + 3
      week = 0 if start_date.month != end_date.month && middle_date.month == end_date.month
    else
      raise InvalidMonthSelectError
    end
    base + week
  end

  # @param [Fixnum] first_wday 0, 1, 2, 3, 4, 5 or 6 (default is 0)
  # @return [Date] first date of the week of this instance's date
  def first_date_of_week(first_wday: 0)
    self - ((wday - first_wday) % 7)
  end
end

require "date"

class Date
  include NthWeekWithRules
end
