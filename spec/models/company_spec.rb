require 'spec_helper'

describe Company do
  before(:each) do  
    @company = FactoryGirl.create(:company)
  end
  
  subject { @company }
 
  it { should respond_to(:name) }
  it { should respond_to(:alias) }
  it { should respond_to(:parent_company_id) }
  it { should respond_to(:company_type_id) }
  it { should respond_to(:state_id) }
  it { should respond_to(:address_line_1) }
  it { should respond_to(:address_line_2) }
  it { should respond_to(:address_line_3) }
  it { should respond_to(:city) }
  it { should respond_to(:zip) }
  it { should respond_to(:url) }
  it { should respond_to(:naic_code) }
  it { should respond_to(:ai_carrier_code) }
  it { should respond_to(:notes) }

  it { should be_valid }
  
  it "should require a name" do
    @company.name = ""
    @company.should_not be_valid
  end
  
  it "should require a unique name" do
    companydup = @company.dup
    companydup.should_not be_valid
  end
  
  it "should have a parent company name" do
    @parent = FactoryGirl.create(:parent_company)
    @company.parent_company_id = @parent.id
    @company.parent_company.name.should eq(@parent.name)
  end
  
  it "should have a company type name" do
    type = FactoryGirl.create(:company_type)
    @company.company_type_id = type.id
    @company.company_type.name.should eq(type.name)
  end
  
  it "should have a state name" do
    state = FactoryGirl.create(:state)
    @company.state_id = state.id
    @company.state.name.should eq(state.name)
  end
end
