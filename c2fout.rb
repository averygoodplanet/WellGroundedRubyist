celsius = File.read("temp.dat").to_i
puts "Celsius read from temp.dat file is: #{celsius}."
fahrenheit = (celsius * 9 / 5) + 32
puts "Fahrenheit (being written to temp.out file) is: #{fahrenheit}"
fh = File.new("temp.out", "w")
fh.puts fahrenheit
fh.close