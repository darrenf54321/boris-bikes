class DockingStation
  attr_reader :bike

  def initialize
    @array = []
  end

  def release_bike
    fail "error - no bikes available" if @array.count <= 0
    @array.pop
  end

  def dock(bike)
    fail "error - docking station has exceeded 20" if @array.count >= 20
    @array << bike

  end

end
