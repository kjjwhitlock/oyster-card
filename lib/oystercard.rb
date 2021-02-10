class OysterCard
  attr_reader :balance, :limit, :entry_station

  DEFAULT_LIMIT = 90
  MIN_TRAVEL_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @limit = DEFAULT_LIMIT
    @entry_station = nil
  end

  def top_up(amount)
      raise "Limit of £#{:limit} exceeded: payment rejected." if @balance + amount >= @limit
      if @balance + amount < @limit then @balance += amount
      end
  end

  def deduct(amount)
      @balance -= amount
end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MIN_TRAVEL_BALANCE
    @entry_station = station
  end

  def touch_out
    deduct(MIN_FARE)
    entry_station = nil
  end

  def in_journey?
  end

end
#putting in a comment
