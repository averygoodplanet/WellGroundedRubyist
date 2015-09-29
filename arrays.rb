my_array = %w[a b c d e f]
# array[index, optional length]
my_array[1, 3]
# assignment
my_array[2, 2] = 'b2' , 'b3'
my_array
# => ["a", "b", "b2", "b3", "e", "f"]
# slice is a synonym for the [] metthod
my_array.slice(2)
# => 'b2'
my_array.slice(4,2)
# => ['e', 'f']
vowels = my_array.values_at(0, 4)
# ['a', 'e']

numbers_array = *(1..4)
# [1, 2, 3, 4]
# add to beginning of array
numbers_array.unshift(0)
# [0, 1, 2, 3, 4]
# add to end of array
numbers_array.push(5)
# [0, 1, 2, 3, 4, 5]
# << only takes one arg
numbers_array << 6
# [0,1,2,3,4,5,6]
numbers_array.push(7,8,9)
# [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]

# remove from beginning with shift
zero = numbers_array.shift
# numbers_array => [1, 2, 3, 4, 5, 6, 7, 8, 9]
# remove from end with pop
nine = numbers_array.pop
# numbers_array => [1, 2, 3, 4, 5, 6, 7, 8]

# concat vs. push
triple = [1,2,3]
# concat changes orig array
triple.concat([4,5,6])
# => [1, 2, 3, 4, 5, 6]
# + doesn't change original array
new_array = triple + [0, 0, 0]



[1,2,3].push([4,5,6])
# => [1, 2, 3, [4, 5, 6]]

a = [1,2]
new_array = a + [3,4]
# a => [1,2]

# replace populate the same array-object with different values
# this is different than assigment to a new array object 
# especially if you have another variable that refers to your array-object
first_variable = [1, 1, 1]
second_variable = first_variable
first_variable.replace([2,2,2])
# second_variable still points to that same array object so => [2,2,2]

# this reassignment, makes first_variable point to a different array object
# than second_variable
first_variable = [3,3,3]
# second_variable still points to the old array object so => [2,2,2]

# flatten defaults to totally flatten
# but takes optional args for levels to flatten
array = [0, [1,1], [ 2, [2, 2]] ]
array.flatten
# [0, 1, 1, 2, 2, 2]
array.flatten(1)
# [0, 1, 1, 2, [2, 2]]
array.flatten(2)
# [0, 1, 1, 2, 2, 2]

array_with_dups = [1, 2, 2, 3, 3, 3]
# counts occurrences
array_with_dups.count(3) # => 3

