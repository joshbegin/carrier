require 'spec_helper'

describe FeedStatus do
  it { should respond_to(:name) }
    
  it { should be_valid }
  
  it "has the correct values" do
    statuses = [
      "In the pipeline",
      "Test",
      "Production"
    ]
  
    statuses.each do |s|
      FeedStatus.find_by_name(s).should be_valid
    end
  end
end
