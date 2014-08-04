class C
  def m
    puts "First definition of method m."
  end

  # overriding the method
  def m
    puts "Second definition of method m."
  end
end

C.new.m # => "Second definition of method m."