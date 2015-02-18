puts "outside of class definition:"
puts self

class C
  puts "Just started class C:"
  puts self
  module M
    puts "Nested module C::M:"
    puts self
  end
  puts "Back in the outer level of C:"
  puts self
end

=begin
main
Just started class C:
C
Nested module C::M:
C::M
Back in the outer level of C:
C
=end