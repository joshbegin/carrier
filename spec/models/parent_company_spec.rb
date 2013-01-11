require 'spec_helper'

describe ParentCompany do
  before(:each) do  
    @parent = FactoryGirl.create(:parent_company)
  end
  
  it "has a valid factory" do
    FactoryGirl.create(:parent_company).should be_valid
  end
  
  subject { @parent }
 
  it { should respond_to(:name) }
  it { should respond_to(:alias) }

  it { should be_valid }
  
  it "is invalid without a name" do
    FactoryGirl.build(:parent_company, name: nil).should_not be_valid
  end
  
  it "should require a unique name" do
    parentdup = @parent.dup
    parentdup.should_not be_valid
  end
end
