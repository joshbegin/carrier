require 'spec_helper'

describe FeedType do
  it { should respond_to(:name) }
    
  it { should be_valid }
  
  it "has the correct values" do
    types = [
      "Pending",
      "Inforce",
      "Commission",
      "License & Appointment",
      "Two-Way Messaging",
      "App Upload"
    ]
  
    types.each do |t|
      FeedType.find_by_name(t).should be_valid
    end
  end
end
