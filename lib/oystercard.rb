class OysterCard
  attr_reader :balance, :limit, :entry_station, :exit_station, :card_history

  DEFAULT_LIMIT = 90
  MIN_TRAVEL_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @limit = DEFAULT_LIMIT
    @current_journey = Journey.new
		@card_history = []
    @entry_station = nil
    @exit_station = nil
  end

  def top_up(amount)
      raise "Limit of £#{:limit} exceeded: payment rejected." if @balance + amount >= @limit
      if @balance + amount < @limit then @balance += amount
      end
  end

  def touch_in(station)
    raise "Insufficient funds" if @balance < MIN_TRAVEL_BALANCE
    @current_journey.set_entry_station(station)
    @entry_station = station
  end

  def touch_out(station)
		deduct(MIN_FARE)
    @current_journey.set_exit_station(station)
		@exit_station = station
    @card_history << {entry: entry_station, exit: exit_station}
		@entry_station = nil
  end

	def history
		@card_history
	end

private


def deduct(amount)
    @balance -= amount
end

end
