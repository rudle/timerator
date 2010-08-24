require File.join(File.expand_path(File.dirname(__FILE__)), '..', 'spec_helper')
require 'timerator/timerator'

describe Timerator, "slice" do
  it "returns 1 second for a 1 second range" do
    timerator = Timerator.new(Time.gm(2000,"jan",1,0,0,0), Time.gm(2000,"jan",1,0,0,1))

    timerator.slice(:second).should == [(Time.gm(2000,"jan",1,0,0,0)..Time.gm(2000, "jan", 1, 0, 0, 1))]
  end

  it "returns 10 seconds for a 10 second range" do
    timerator = Timerator.new(Time.gm(2000,"jan",1,0,0,0), Time.gm(2000,"jan",1,0,0,10))

    slices = timerator.slice :second

    slices[0].should == (Time.gm(2000,"jan",1,0,0,0)..Time.gm(2000,"jan",1,0,0,1))
    slices[1].should == (Time.gm(2000,"jan",1,0,0,1)..Time.gm(2000,"jan",1,0,0,2))
    slices[9].should == (Time.gm(2000,"jan",1,0,0,9)..Time.gm(2000,"jan",1,0,0,10))
  end

  it "returns 1 week for one week" do
    timerator = Timerator.new(Time.gm(2000, "jan", 1, 0, 0, 0), Time.gm(2000, "jan", 8, 0, 0, 0))

    slices = timerator.slice :week
    slices.should == [(Time.gm(2000, "jan", 1, 0,0,0)..Time.gm(2000, "jan", 8,0,0,0))]
  end

  it "returns the remainder of the period if it cannot fill one" do
    timerator = Timerator.new(Time.gm(2000,"jan",1,0,0,0), Time.gm(2000,"jan",1,10,0,0))

    slices = timerator.slice :day
    slices.should == [(Time.gm(2000, "jan", 1,0,0,0)..Time.gm(2000, "jan", 1, 10, 0,0))]
  end

  it "handles minutes" do
    timerator = Timerator.new(Time.gm(2000,"jan",1,0,0,0), Time.gm(2000,"jan",1,0,1,0))

    slices = timerator.slice :minute
    slices.should == [(Time.gm(2000,"jan",1,0,0,0)..Time.gm(2000,"jan",1,0,1,0))]
  end

  it "handles hours" do
    timerator = Timerator.new(Time.gm(2000,"jan",1,0,0,0), Time.gm(2000,"jan",1,2,0,0))

    slices = timerator.slice :hour
    slices[0].should == (Time.gm(2000, "jan", 1,0,0,0)..Time.gm(2000, "jan", 1, 1, 0,0))
  end
end

describe Timerator, "each" do
  it "should run once for a range of one period" do
    timerator = Timerator.new(Time.gm(2000,"jan",1,0,0,0), Time.gm(2000,"jan",1,1,0,0))

    slices = []
    timerator.each(:hour) do |start_point, end_point|
      slices << (start_point..end_point)
    end

    slices.should == [(Time.gm(2000, "jan",1,0,0,0)..Time.gm(2000,"jan",1,1,0,0))]
  end
end
