class Ticket
  def initialize(venue, date)
    @venue = venue
    @date = date
  end

  def venue
    @venue
  end

  def date
    @date
  end

  # def set_price(amount)
  #   @price = amount
  # end

  # def price=(amount)
  #   @price = amount
  # end

  def price=(amount)
    # using setter method to check for proper input
    if (amount * 100).to_i == amount * 100
      @price = amount  
    else
      puts "The price seems to be malformed."
    end
  end

  def price
    @price
  end
end