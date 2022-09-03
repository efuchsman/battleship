class Player
attr_reader :fleet
  def initialize(fleet)
    @fleet = fleet
  end

  def health_of_ship_at(index)
    if @fleet.length > 0
      @fleet[index].health
    else
      nil
    end
  end



end
