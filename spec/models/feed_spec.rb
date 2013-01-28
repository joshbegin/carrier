require 'spec_helper'

describe Feed do
  let(:feed) { FactoryGirl.create(:feed) }
  let(:company) { FactoryGirl.create(:company) }
  
  it { should respond_to(:name) }
    
  it "has a valid factory" do
    FactoryGirl.create(:feed).should be_valid
  end
  
  it "is invalid without a type" do
    FactoryGirl.build(:feed, feed_type_id: nil).should_not be_valid
  end
  
  it "is invalid without a status" do
    FactoryGirl.build(:feed, feed_status_id: nil).should_not be_valid
  end
  
  it "is invalid without a company" do
    FactoryGirl.build(:feed, company_id: nil).should_not be_valid
  end
  
  it "has the correct frequency" do
    frequency = FeedFrequency.find(1).name
    feed.feed_frequency.name.should eq(frequency)
  end
  
  it "has the correct status" do
    status = FeedStatus.find(1).name
    feed.feed_status.name.should eq(status)
  end
  
  it "has the correct type" do
    type = FeedType.find(1).name
    feed.feed_type.name.should eq(type)
  end
  
  it "has the correct company" do
    feed.company = company
    feed.company.name.should eq(company.name)
  end
end
