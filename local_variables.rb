def say_goodbye
  x = "Goodbye"
  puts x
end

def start_here
  x = "Hello"
  puts x
  say_goodbye
  puts "Let's check whether x remained the same: "
  puts x # <-- local variable x is still "Hello" in this method
end

start_here