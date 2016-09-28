class DockingStation
  attr_reader :bike
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @array = []
    @capacity = capacity
  end

  def release_bike
    fail "error - no bikes available" if empty?
    array.pop
  end

  def dock(bike)
    fail "error - docking station has exceeded capacity" if full?
    array << bike
  end

private

attr_reader :array

def full?
  array.count >= capacity
end

def empty?
  array.count <= 0
end

end
