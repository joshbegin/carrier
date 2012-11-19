require 'spec_helper'

describe State do
  
  it { should respond_to(:name) }
  it { should respond_to(:abbreviation) }
  
  it { should be_valid }
end
