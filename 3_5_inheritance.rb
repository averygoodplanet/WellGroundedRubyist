class Publication
  attr_accessor :publisher
end

class Magazine < Publication
  attr_accessor :editor
end

####################

class Person
  def species
    "Homo sapiens"
  end
end

class Rubyist < Person
end