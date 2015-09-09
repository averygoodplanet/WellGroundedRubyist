obj = Object.new

def obj.+(other_object)
  "Trying to add something to me, eh?"
end

class Account
  attr_accessor :balance

  def initialize(amount = 0)
    self.balance = amount
  end

  def +(x)
    self.balance += x
  end

  def -(x)
    # if you don't want to return the balance you can do semicolon nil 
    # self.balance -= x ; nil
    self.balance -= x
  end

  def to_s
    balance.to_s
  end
end

acc = Account.new(20)
acc -= 5
puts acc