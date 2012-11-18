require 'spec_helper'

describe ParentCompany do
  before(:each) do  
    @parent = FactoryGirl.create(:parent_company)
  end
  
  subject { @parent }
 
  it { should respond_to(:name) }
  it { should respond_to(:alias) }

  it { should be_valid }
  
  it "should require a name" do
    @parent.name = ""
    @parent.should_not be_valid
  end
  
  it "should require a unique name" do
    parentdup = @parent.dup
    parentdup.should_not be_valid
  end
end
