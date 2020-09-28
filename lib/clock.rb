# clock.rb
def clock(hours, minutes, seconds)
  time_segments = [hours, minutes, seconds]
  max_values = [23, 59, 59]

  # if don't require args --> this doesn't work now b/c args are non-optional
  if time_segments.empty?
    return "00:00:00"
  end

  time_segments.each_with_index do |segment, index|
    if segment > max_values[index]
      # raise is used to stop execution and leave the method immediately,
      # and it's used to indicate an error to the user.
      # In this case it prevents the user from providing clock invalid arguments
      raise ArgumentError.new("#{segment} is too large")
    elsif segment < 0
      raise ArgumentError.new("#{segment} is invalid (negative)")
    end
  end

  time_segments.map! { |segment| segment < 10 ? ("0#{segment}") : (segment.to_s) }

  formatted_time = "#{time_segments[0]}:#{time_segments[1]}:#{time_segments[2]}"
  return formatted_time
end

# p clock()

# def clock(hours, minutes, seconds)
#   time_fields = [hours, minutes, seconds]
#
#   time_strings = time_fields.map do |field|
#     if field < 10
#       '0#{field}'
#     else
#       '#{field}'
#     end
#   end
#
#   return '#{time_strings[0]}:#{time_strings[1]}:#{time_strings[2]}'
# end