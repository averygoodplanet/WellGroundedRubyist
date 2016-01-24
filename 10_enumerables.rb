class C
  include Enumerable

  # you must have each defined in the class to take advantage of Enumerable module
  # you can define your own each method
  def each
    yield 1
    yield 2
    yield 3
  end
end


# once you  add Enumerable module to a
class and then define the .each method #
the objects of this class have access to
the instance methods from the  # Enumerable
class, e.g. Enumerable.instance_methods(false).sort
#  [:all?, :any?, :chunk,
# :collect, :collect_concat, :count, :cycle,
# :detect, :drop, :drop_while, :each_cons,
# :each_entry, :each_slice, :each_with_index,
# :each_with_object, :entries, :find,
# :find_all, :find_index, :first, :flat_map,
# :grep, :group_by, :include?, :inject, :map,
# :max, :max_by, :member?, :min, :min_by,
# :minmax, :minmax_by, :none?, :one?,
# :partition, :reduce, :reject,
# :reverse_each, :select, :slice_before,
# :sort, :sort_by, :take, :take_while, :to_a,
# :zip]
c = C.new c.find_all{|num| num > 1}

hash = {one: 1, two: 2, three: 3}

# hash's .each method can yield either |key, value|, 
# or |array| where array[0] is the key and array[1] is the value
hash.each {|key, value| puts "key: #{key}, value: #{value}"}
# key: one, value: 1
# key: two, value: 2
# key: three, value: 3
# {
#       :one => 1,
#       :two => 2,
#     :three => 3
# }
irb(main):012:0> hash.each{|array| puts "key: #{array[0]}, value: #{array[1]}"}
# key: one, value: 1
# key: two, value: 2
# key: three, value: 3
# {
#       :one => 1,
#       :two => 2,
#     :three => 3
# }

# Enumerable methods on arrays
cities = ['Chicago', 'New York', 'Washington, D.C.', 'Nashville', 'New Orleans']
cities.include?('Chicago')
cities.all? {|city| city.length > 1}
cities.any? {|city| city.length < 1}
# one and only one
cities.one? {|city| city.include?('D.C.')}
cities.none? {|city| city.include?('X')}

cities_hash = {'Chicago' => 'Illinois', 'New York' => 'New York', 'Washington' => 'D.C.',
                          'Nashville' => 'Tennesse', 'New Orleans' => 'Louisiana'}
# the include? method searches Hash keys
cities_hash.include?('Chicago')
# => true
# .all? on a Hash has an array [key, value] yielded to the code block
cities_hash.all?{|key, value| !value.include?('D.C.')}
# false
cities_hash.all?{|key, value| !key.include?('D.C.')}
# true

integer_ranger = Range.new(1,4)
integer_range.one?{|num| num == 4}
# true

# ranges fail where cannot do a .each
float_range.each {|num| puts num}
# TypeError: can't iterate from Float
float_range.any? {|num| num == 1.0}
# TypeError: can't iterate from Float
#   from (irb):3:in `each'
#   from (irb):3:in `any?

# .find_all, .select, .reject

vegetables = %w[cabbage lettuce broccoli squash tomatos]
# grep to search for regexp match
vegetables.grep(/ca/)
[
    [0] "cabbage"
]
# grep does a select with threequal operator === as truth test
# can check for strings, since e.g. String === 'a string' => true
String === 'a string'
irb(main):012:0> various_datatypes = ["cabbage", "banana", 3, :symbol]
[
    [0] "cabbage",
    [1] "banana",
    [2] 3,
    [3] :symbol
]
irb(main):013:0> various_datatypes.grep(String)
[
    [0] "cabbage",
    [1] "banana"
]
# gives result to code block, uses code block to modify
various_datatypes.grep(String) {|result| result.upcase}
[
    [0] "CABBAGE",
    [1] "BANANA"
]

# partition does boolean test and returns array of two arrays,
# the 0th being 'true' results, and 1th being 'false' results
vegetables.partition{|veg| veg.start_with?('c')}
[
    [0] [
        [0] "cabbage"
    ],
    [1] [
        [0] "lettuce",
        [1] "broccoli",
        [2] "squash",
        [3] "tomatos"
    ]
]
irb(main):020:0> words = %w[beans bags bills cat car carp dog fox giraffe]
[
    [0] "beans",
    [1] "bags",
    [2] "bills",
    [3] "cat",
    [4] "car",
    [5] "carp",
    [6] "dog",
    [7] "fox",
    [8] "giraffe"
]
# group_by creates a hash, where keys are the condition passed in code block
irb(main):021:0> words.group_by{|word| word[0]}
{
    "b" => [
        [0] "beans",
        [1] "bags",
        [2] "bills"
    ],
    "c" => [
        [0] "cat",
        [1] "car",
        [2] "carp"
    ],
    "d" => [
        [0] "dog"
    ],
    "f" => [
        [0] "fox"
    ],
    "g" => [
        [0] "giraffe"
    ]
}
# enumerable.first
# there isn't a .last on Enumerable because not all collections have a last element,
# for example, if yield elements infinitely; yet some collections like Array do have .last method


# return the n number of elements from enumerable
irb(main):022:0> words.take(1)
[
    [0] "beans"
]
# give the remainder of the enumerable after doing a take(n)
irb(main):023:0> words.drop(1)
[
    [0] "bags",
    [1] "bills",
    [2] "cat",
    [3] "car",
    [4] "carp",
    [5] "dog",
    [6] "fox",
    [7] "giraffe"
]


irb(main):027:0> new_words = ["ant", "ale", "art", "banana", "apple"]
[
    [0] "ant",
    [1] "ale",
    [2] "art",
    [3] "banana",
    [4] "apple"
]
# returns a group from the beginning of all those that match in a row
irb(main):028:0> new_words.take_while {|word| word.start_with?('a')}
[
    [0] "ant",
    [1] "ale",
    [2] "art"
]
# returns a group from the remainder of the enumerable after removing the 
# take_while portion
irb(main):029:0> new_words.drop_while {|word| word.start_with?('a')}
[
    [0] "banana",
    [1] "apple"
]
# .min, .max
# .minmax returns both min and max
irb(main):038:0> [1, 2, 3, 4, 5].minmax
[
    [0] 1,
    [1] 5
]

# .each_with_index
irb(main):048:0> ['a', 'b', 'c'].each_with_index do | element, index |
irb(main):049:1* puts index.to_s + " " + element
irb(main):050:1> end
0 a
1 b
2 c

irb(main):052:0> {"fruit" => "apple", "vegetable" => "brocolli", "meat" => "steak"}.each_with_index do | (key, value), i|
irb(main):053:1* puts "key: #{key} value: #{value} i: #{i}"
irb(main):054:1> end
key: fruit value: apple i: 0
key: vegetable value: brocolli i: 1
key: meat value: steak i: 2
{
        "fruit" => "apple",
    "vegetable" => "brocolli",
         "meat" => "steak"
}

# goes through enumerable a slice at a time
irb(main):058:0> [1,2,3,4,5,6,7].each_slice(2) {|slice| p slice}
[1, 2]
[3, 4]
[5, 6]
[7]
# each_cons takes overlapping groups progressing forward by on each time
irb(main):059:0> [1,2,3,4,5,6,7].each_cons(2) {|slice| p slice}
[1, 2]
[2, 3]
[3, 4]
[4, 5]
[5, 6]
[6, 7]

# cycle(1) is like doing a .each
irb(main):062:0> [1,2,3,4,5,6,7].cycle(1) {|num| puts num}
1
2
3
4
5
6
7
nil
# cycle(2)  goes through the enumerable twice
irb(main):063:0> [1,2,3,4,5,6,7].cycle(2) {|num| puts num}
1
2
3
4
5
6
7
1
2
3
4
5
6
7

# reduce and inject are the same method
# it starts by setting an accumulator object with the argument passed 
# (or if no argument passed, then to the first value in the enumerable) 
# does an operation in the code block and sets the accumulator object
# to that value ... and so on
[2, 4, 8, 16].reduce {|acc, num| acc + num}
# e.g. 2 + 4 => 6
# 6 + 8 => 14
# 14 + 16 => 30
=> 30

# .map returns a new array with the results of performing the operation
# in the code block on each element
[1, 2, 3].map{|num| num * 2}
[
    [0] 2,
    [1] 4,
    [2] 6
]
# in .map can do e.g. foo.map(&:method_performed)
# e.g. foo.map(&:nil?)
[1, 2, 3].map{|num| num.nil?}
[
    [0] false,
    [1] false,
    [2] false
]
[1, 2, 3].map(&:nil?)
[
    [0] false,
    [1] false,
    [2] false
]

# for strings:
# .each_byte {...},  .bytes, .btyes.to_a
# .each_char {...}, .chars. chars.to_a
# .each_codepoint {...}, .codepoints, .codepoints.to_a
# .each_line {...}, .lines, .lines.to_a

# defining <=> spaceship operator for a class so that 
# when it is put in an array (or other enumerable object)
# that it has a comparison operator definition in order to array.sort
class Painting
  # you could include Comparable if you want to be able 
  # to do things like p1 > p2 outside of an enumerable sort
  attr_accessor :price
  def initialize(price)
    @price = price
  end

  def <=> (other_painting)
    self.price <=> other_painting.price
  end
end

irb(main):087:0> p1 = Painting.new(10)
#<Painting:0x007f8c03038c48 @price=10>
irb(main):089:0> p2 = Painting.new(20)
#<Painting:0x007f8c0124b028 @price=20>
irb(main):090:0> p3 = Painting.new(30)
#<Painting:0x007f8c01250d48 @price=30>
irb(main):091:0> array = [p2, p1, p3]
[
    [0] #<Painting:0x007f8c0124b028 @price=20>,
    [1] #<Painting:0x007f8c03038c48 @price=10>,
    [2] #<Painting:0x007f8c01250d48 @price=30>
]
irb(main):092:0> array.sort
[
    [0] #<Painting:0x007f8c03038c48 @price=10>,
    [1] #<Painting:0x007f8c0124b028 @price=20>,
    [2] #<Painting:0x007f8c01250d48 @price=30>
]

# you can pass <=> spaceship operator in .sort
class Bucket
  attr_reader :size
  def initialize(size)
    @size = size
  end
end
irb(main):130:0> [b3, b1, b2].sort
# ArgumentError: comparison of Bucket with Bucket failed
irb(main):132:0> [b3, b1, b2].sort{|a, b| a.size <=> b.size}
[
    [0] #<Bucket:0x007f8c01821948 @size=10>,
    [1] #<Bucket:0x007f8c030480d0 @size=20>,
    [2] #<Bucket:0x007f8c012c2fd8 @size=30>
]
# sort_by alwayrs requires a code block, and describes the sort condition
# for one object instead of two
[b3, b1, b2].sort_by{|a| a.size}
[
    [0] #<Bucket:0x007f8c01821948 @size=10>,
    [1] #<Bucket:0x007f8c030480d0 @size=20>,
    [2] #<Bucket:0x007f8c012c2fd8 @size=30>
]
# .sort_by(&:size)


# the y << foo there is telling it what to yield when it 
# performs .each
irb(main):135:0> e = Enumerator.new do |y| 
irb(main):136:1* y << 1
irb(main):137:1> y << 2
irb(main):138:1> y << 3
irb(main):139:1> end
#<Enumerator: #<Enumerator::Generator:0x007f8c01815120>:each>
irb(main):140:0> e.to_a
[
    [0] 1,
    [1] 2,
    [2] 3
]
irb(main):141:0> e.map{|num| num * 2}
[
    [0] 2,
    [1] 4,
    [2] 6
]
# enumerator is an Object which has methods of Enumberable class

# enumerator attached to another object
["a", "b", "c"].enum_for(:select)
e.each {|n| n.include?('b')}

# many iterators, when called without a block, return an enumerator
irb(main):147:0> "abc".chars
#<Enumerator: "abc":chars>

# Enumerators use methods defined in Enumerable, and therefore 
# not the an methods in the object they pull from which override Enumerable
# methods
irb(main):151:0> h.select{|key, value| key =~ /c/ }
{
    "c" => "cat"
}
irb(main):152:0> h.to_enum.select{|key, value| key =~ /c/ }
[
    [0] [
        [0] "c",
        [1] "cat"
    ]
]

# Enumerators can be used to let 'someone'  look at and iterate over
# a collection object while preventing changes to the collection
irb(main):153:0> h['f'] = "fox"
"fox"
irb(main):154:0> h.to_enum['g'] = 'giraffe'
# Enumerator doesn't allow setting this new vaiue
# NoMethodError: undefined method `[]=' for #<Enumerator:0x007f8c0127e1a8>



irb(main):157:0> letters.each {}
[
    [0] "a",
    [1] "b",
    [2] "c",
    [3] "d",
    [4] "e",
    [5] "f",
    [6] "g"
]
# as an object, enumerators maintain state, keeping track of where it is
# in iterating, and so you can step through it, and rewind it.
irb(main):158:0> e = letters.to_enum
#<Enumerator: ["a", "b", "c", "d", "e", "f", "g"]:each>
irb(main):159:0> e.next
"a"
irb(main):160:0> e.next
"b"
irb(main):161:0> e.next
"c"
irb(main):162:0> e.rewind
#<Enumerator: ["a", "b", "c", "d", "e", "f", "g"]:each>
irb(main):163:0> e.next
"a"

module Music
  class Scale
    NOTES = %w[ c d e f g a b c2]

    def play
      NOTES.each {|note| yield note}
    end
  end
end
# the above class does NOT include Enumerable class
scale = Music::Scale.new
irb(main):175:0> scale.play {|note| puts "Next note is #{note}"}
Next note is c
Next note is d
Next note is e
Next note is f
Next note is g
Next note is a
Next note is b
Next note is c2
irb(main):176:0> enum = scale.enum_for(:play)
#<Enumerator: #<Music::Scale:0x007f8c0122c470>:play>
# We get access to Enumerable class here, by 
# creating an enumerator that uses a method on another object, 
# in this case the 'play' method, as the enumerator's each method.
irb(main):178:0> enum.map{|n| n.upcase}
[
    [0] "C",
    [1] "D",
    [2] "E",
    [3] "F",
    [4] "G",
    [5] "A",
    [6] "B",
    [7] "C2"
]

# you can use Enumerator to make .with_index method available
['a','b','c'].to_enum.with_index{|a, i| puts "element:" + a + " index:" + i.to_s}
element:a index:0
element:b index:1
element:c index:2
# althought array.each_with_index already available.