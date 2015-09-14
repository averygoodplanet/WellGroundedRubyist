class Bid
  include Comparable
  attr_accessor :estimate

  # def <=> (other_bid)
  #   if self.estimate < other_bid.estimate
  #     -1
  #   elsif self.estimate > other_bid.estimate
  #     1
  #   else
  #     # if they are to be considere equal
  #     0
  #   end
  # end
  # because estimates will either by Integer or Float class
  # and these classes already know how to compare each other
  # we can shorten the method
  def <=> (other_bid)
    self.estimate <=> other_bid.estimate
  end
end