require 'spec_helper'

describe Bike do
  it { is_expected.to respond_to
  :working?}

  it { is_expected.to respond_to :report_broken}

  describe "#report broken" do
    it "should make working? false" do
      bike = Bike.new
      bike.report_broken
      expect(bike.working).to eq(false)
    end
  end
end
