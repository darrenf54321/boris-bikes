require 'spec_helper'

  describe DockingStation do

   it { is_expected.to respond_to :release_bike}

   it "should get a working bike" do
     bike = Bike.new
     expect(bike).to be_working
   end

    it { is_expected.to respond_to(:bike) }

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'returns docked bikes' do
      bike = Bike.new
      expect(subject.dock(bike)).to eq bike
    end

    it 'should raise an error if no bikes available' do
      expect{subject.release_bike}.to raise_error("error - no bikes available")
    end

end
