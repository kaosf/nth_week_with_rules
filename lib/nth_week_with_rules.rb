require "nth_week_with_rules/version"

module NthWeekWithRules
  # @param [Fixnum] first_wday 0, 1, 2, 3, 4, 5 or 6 (default is 0)
  # @param [Symbol] month_select :normal, :before, :after, :many (default is :normal)
  # @param [Fixnum] base 0 or 1 (default is 1)
  # @return [Fixnum] An integer from 1 to 6 (from 0 to 5 if **base** is 0)
  def nth_week(first_wday: 0, month_select: :normal, base: 1)
    start_date  = first_date_of_week(first_wday: first_wday)
    end_date    = start_date + 7

    week = (start_date.day + 5) / 7
    case month_select
    when :normal
      if start_date.month != end_date.month && self.month == end_date.month
        week = 0
      end
    when :before
      # Do nothing
    when :after
      if start_date.month != end_date.month
        week = 0
      end
    when
      middle_date = start_date + 3
      if start_date.month != end_date.month && middle_date.month == end_date.month
        week = 0
      end
    else
      # Error
    end
    base + week
  end

  # @param [Fixnum] first_wday 0, 1, 2, 3, 4, 5 or 6 (default is 0)
  # @return [Date] first date of the week of this instance's date
  def first_date_of_week(first_wday: 0)
    self - ((self.wday - first_wday) % 7)
  end
end

require "date"

class Date
  include NthWeekWithRules
end
