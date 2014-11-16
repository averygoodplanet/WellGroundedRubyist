# Object ancestry ... the Object class
class C
end

class D < C
end

puts "D.superclass: #{D.superclass}"
puts "D.superclass.superclass: #{D.superclass.superclass}"

