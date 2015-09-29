# create a hash
my_hash = {}
my_hash = Hash.new
my_hash['not a key'] 
# => nil

# optional arg which is used as value for non-existent keys
hash_with_default_values = Hash.new(:value_for_keys_not_found)
hash_with_default_values['not a key']
# => :value_for_keys_not_found

# see the default value of a hash
state_hash.default 
# => nil
state_hash['not a key']
# => nil
state_hash.default = :go_fish
state_hash['not a key']
# => :go_fish
state_hash.default
# => :go_fish

# creating with even number of key, value ... key, value 
state_hash = Hash['Tennessee', 'TN', 'Illinois', 'IL']
# => {"Tennessee"=>"TN", "Illinois"=>"IL"}
# normal brackets method returns nil if key not found (unless default value set on Hash)
state_hash['Kentucky']
# => nil
# fetch raises exception if the key isn't found
state_hash.fetch('Kentucky')
# KeyError: key not found: "Kentucky"

# retrieve multiple values
two_values = state_hash.values_at('Tennessee', 'Illinois')
# => ["TN", "IL"]

# to have the hash take a non-existent key, add that key and set it to zero
h = Hash.new {|hash, key| hash[key] = 0}
h['a']
# => 0
h
# => {"a"=>0}

h1 = {'a'=> 'apple', 'b'=> 'banana'}
#=> {"a"=>"apple", "b"=>"banana"}
h2 = {'a'=> 'ant'}
# => {"a"=>"ant"}
h3 = h1.merge(h2)
# => {"a"=>"ant", "b"=>"banana"}
h1
# => {"a"=>"apple", "b"=>"banana"}
# destructive with merge! bang or with update
h1.merge!(h2)
# => {"a"=>"ant", "b"=>"banana"}
h1
# => {"a"=>"ant", "b"=>"banana"}

#invert
h1.invert
# => {"ant"=>"a", "banana"=>"b"}
# since keys are unique and values aren't, you can lose data if you invert a 
# hash that prior to inversion has multiple same values
h4 = { 1 => 'unique', 2 => 'duplicate', 3 => 'duplicate', 4 => 'special'}
h4.invert
#   => {"unique"=>1, "duplicate"=>3, "special"=>4}

h4.has_key?('unique')
h4.has_value?(3)


