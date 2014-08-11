class Ticket
  attr_reader :venue, :date, :price
  # attr_writer :price
  # attr :price, true
  attr_accessor :price

  def initialize(venue, date)
    @venue = venue
    @date = date
  end
end