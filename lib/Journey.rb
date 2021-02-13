require_relative 'oystercard'

class Journey

  def initialize
    @entry = @entry_station.clone
  end

    def set_entry_station(station)
    end

    def set_exit_station(station)
    end

    def in_journey?
      return true if @entry != nil
    end

end
