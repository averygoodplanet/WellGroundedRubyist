class Person
  attr_accessor :first_name, :middle_name, :last_name

  def whole_name
    # first_name here is example of calling an instance method from within another
    # instance method (e.g. where self is the INSTANCE object)
    n = first_name + " "
    n << "#{middle_name} " if middle_name
    n << last_name
  end
end