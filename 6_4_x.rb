# raising and handling exceptions
def open_user_file
  print "File to open: "
  filename = gets.chomp
  fh = File.open(filename)
  yield fh
  fh.close
  # you can leave out 'begin' and 'end' if you want rescue to apply to the 
  # whole block or method
  rescue
    puts "Couldn't open your file!"
end

# you can raise your own errors
def fussy_method(x)
  raise ArgumentError, "I need a number under 10" unless x < 10
end

