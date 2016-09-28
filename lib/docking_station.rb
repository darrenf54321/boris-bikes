class DockingStation
  attr_reader :bike

  def release_bike
    fail "error - no bikes available" unless @bike
    @bike
  end

  def dock(bike)
    fail "error - docking station is full" if @bike
    @bike = bike
  end
  
end
