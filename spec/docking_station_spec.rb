require 'spec_helper'


  describe DockingStation do

   it { is_expected.to respond_to :release_bike}

   it "should get a working bike" do
     bike = double(:bike)
     allow(bike).to receive(:working).and_return(true)
     expect(bike.working).to eq true
   end

    it { is_expected.to respond_to(:bike) }

    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'returns docked bikes' do
      bike = double(:bike)
      allow(bike).to receive(:working).and_return(true)
      subject.dock(bike)
      expect(subject.release_bike).to eq bike
    end

    describe '#docking_station' do
      it 'should raise an error if no bikes available' do
        expect{subject.release_bike}.to raise_error("error - no bikes available")
      end
    end

    describe '#dock' do
      it "should not accept more bikes than its capacity" do
        bike = double(:bike)
        allow(bike).to receive(:working).and_return(true)
        DockingStation::DEFAULT_CAPACITY.times { subject.dock bike }
        expect{subject.dock(bike)}.to raise_error("error - docking station has exceeded capacity")
      end
      it "should recognise a broken bike" do
        bike = double(:bike)
        allow(bike).to receive(:working).and_return(false)
          allow(bike).to receive(:report_broken).and_return(false)
        #broken_bike = bike
        bike.report_broken
        expect(subject.dock(bike)).to eq("Thanks for returning a faulty bike.")
      end
    end

    describe '#initialize' do
      it "should not accept more bikes than newly specified capacity" do
        bike = double(:bike)
        allow(bike).to receive(:working).and_return(true)
        subject.capacity.times { subject.dock bike }
        expect{subject.dock(bike)}.to raise_error("error - docking station has exceeded capacity")
      end

      it "should not accept more bikes than 50" do
        docking_station = DockingStation.new(50)
        bike = double(:bike)
        allow(bike).to receive(:working).and_return(true)
        50.times {docking_station.dock bike}
        expect{docking_station.dock(bike)}.to raise_error("error - docking station has exceeded capacity")
      end

      it 'has a default capacity' do
        expect(subject.capacity).to eq DockingStation::DEFAULT_CAPACITY
      end
    end

    describe '#release_bike' do

      it "should not release a broken bike" do
        bike = double(:bike)
        allow(bike).to receive(:working).and_return(false)
        subject.dock(bike)
        expect{subject.release_bike}. to raise_error("error - no bikes available")
      end
    end

  end
