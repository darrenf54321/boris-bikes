class DockingStation
  attr_reader :bike, :not_working
  attr_accessor :capacity
  DEFAULT_CAPACITY = 20

  def initialize(capacity = DEFAULT_CAPACITY)
    @array = []
    @capacity = capacity
    @not_working = []
  end

  def release_bike
    fail "error - no bikes available" if empty?
    array.pop
  end

  def dock(bike)
    fail "error - docking station has exceeded capacity" if full?
      if bike.working
        array << bike
      else
        not_working << bike
        "Thanks for returning a faulty bike."
  end
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
