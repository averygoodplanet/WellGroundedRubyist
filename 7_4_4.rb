class Person
  attr_accessor :name, :age, :email

  def to_str
    name
  end

  def to_ary
    [:name, :age, :email]
  end
end

david = Person.new
david.name = 'David'

puts 'david is name ' + david + '.'

# irb(main):014:0> david
# => #<Person:0x007fde9c161200 @name="David">
# irb(main):015:0> 'string' + david
# => "stringDavid"

david.age = 49
david.email = 'david@wherever'

array = []
array.concat(david)
p array