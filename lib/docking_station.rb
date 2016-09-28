class DockingStation
  attr_reader :bike
  DEFAULT_CAPACITY = 20

  def initialize
    @array = []
  end

  def release_bike
    fail "error - no bikes available" if empty?
    @array.pop
  end

  def dock(bike)
    fail "error - docking station has exceeded 20" if full?
    @array << bike
  end

private

def full?
  @array.count >= DEFAULT_CAPACITY
end

def empty?
  @array.count <= 0
end

end
