# creating inclusive ranges
inclusive_range = Range.new(1,10)
# two dots
another_inclusive_range = 2..5

# creating exclusive ranges
exclusive_range = Range.new(1, 10, true)
# three dots
another_exclusive_range = 2...5

inclusive_range.begin
# => 1
inclusive_range.end
# => 10
inclusive_range.exclude_end?
# => false