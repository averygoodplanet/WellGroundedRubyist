def change_string(str)
  str.replace("New string content!")
end

s = "Original string content!"
s.freeze
puts change_string(s)
puts s