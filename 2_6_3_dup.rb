def change_string(str)
  str.replace("New string content!")
end

s = "Original string content!"
puts change_string(s.dup)
puts s