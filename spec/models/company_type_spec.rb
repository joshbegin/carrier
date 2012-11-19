require 'spec_helper'

describe CompanyType do
  
  it { should respond_to(:name) }
  
  it { should be_valid }
end
