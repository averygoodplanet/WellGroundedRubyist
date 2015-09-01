class Car
  @@makes = []
  @@cars = {}

  attr_reader :make

  def self.total_count
    # an instance variable on a class
    @total_count ||= 0
  end

  def self.total_count=(n)
    @total_count = n
  end

  def self.add_make(make)
    unless @@makes.include?(make)
      @@makes << make
      @@cars[make] = 0
    end
  end

  def initialize(make)
    if @@makes.include?(make)
      puts "Creating a new #{make}!"
      @make = make
      @@cars[make] += 1
      self.class.total_count += 1
    else
      raise "No such make: #{make}."
    end
  end

  def make_mates
    @@cars[self.make]
  end
end

class Hybrid < Car
end

["Honda", "Toyota", "Subaru"].each do | manufacturer |
  Car.add_make(manufacturer)
end

h1 = Car.new("Honda")
h2 = Car.new("Honda")
f = Car.new("Subaru")
puts "Number of Hondas: #{h1.make_mates}"
Hybrid.add_make("Nissan")
hybrid1 = Hybrid.new("Nissan")
puts "Total number of regular cars #{Car.total_count}"
puts "Total number of hybrids #{Hybrid.total_count}"