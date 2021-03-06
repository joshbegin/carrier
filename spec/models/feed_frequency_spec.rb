require 'spec_helper'

describe FeedFrequency do
  it { should respond_to(:name) }

  it { should be_valid }

  it "has the correct values" do
    frequencies = [
      "Real-time",
      "Every 15 minutes",
      "Every 30 minutes",
      "Hourly",
      "Hourly during business hours",
      "8 times per day",
      "7 times per day",
      "6 times per day",
      "5 times per day",
      "4 times per day",
      "3 times per day",
      "Twice a day",
      "Daily",
      "Twice a week",
      "Weekly",
      "Bi-weekly",
      "Monthly"]
  
    frequencies.each do |f|
      FeedFrequency.find_by_name(f).should be_valid
    end
  end
 
end
