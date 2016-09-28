
class DockingStation
  def release_bike
    fail "error - no bikes available" unless @bike
    @bike
  end

  def dock(bike)
    @bike = bike
  end

  attr_reader :bike
end
