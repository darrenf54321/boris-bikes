<<<<<<< HEAD
require "docking_station"

describe DockingStation do
 it { is_expected.to respond_to :release_bike}
 it "should get a working bike" do
   bike = subject.release_bike
   expect(bike).to be_working
 end
=======
require 'docking_station'

describe DockingStation do

  it { is_expected.to respond_to :release_bike }
>>>>>>> 3d197a6c57aedff7bc5dc6fe6ab5050df902a765
end
