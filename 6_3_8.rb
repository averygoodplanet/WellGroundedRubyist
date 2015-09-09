def block_scope_demo
  # block variables that aren't block params (block params are between pipes)
  # have access to variables already in local scope
  x = 100
  1.times  do
    puts x # 100
  end
end

def block_local_parameter
  x = 100
  [1,2,3,].each do |x|
    # block parameter |x| in pipes
    puts "Parameter x is #{x}"
    # assignment to x in the block
    x = x + 10
    puts "Reassigned to x in block; it's now #{x}"
  end
  puts "Outer x is still #{x}"
end

def block_local_variable
  x = "Original x!"
  3.times do |i;x|
    # semicolon makes x a reserved name in the block
    # separate from any other x in local scope
    x = i
    puts "x in the block is now #{x}"
  end
  puts "x after the block ended is #{x}"
end