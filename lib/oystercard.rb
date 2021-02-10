class OysterCard
  attr_reader :balance, :limit, :entry_station, :exit_station, :card_history

  DEFAULT_LIMIT = 90
  MIN_TRAVEL_BALANCE = 1
  MIN_FARE = 1

  def initialize
    @balance = 0
    @limit = DEFAULT_LIMIT
		@entry_station = nil
		@exit_station = nil
		@card_history = []
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

  def touch_out(station)
		deduct(MIN_FARE)
		
		@entry_station = nil
		@exit_station = station
  end

	def in_journey?
		return true if @entry_station != nil
	end
	
	def history
		journey = {}

		@card_history << journey 
	end

end
#putting in a comment

# card = OysterCard.new
# card.touch_in(entry)
# card.touch_out(exit)
# card.history -> [{entry: 'Brixton', exit: 'Victoria'}]