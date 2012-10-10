require 'spec_helper'

describe User do
  before(:each) do  
    @user = FactoryGirl.create(:user)
  end

  subject { @user }
 
  it { should respond_to(:first_name) }
  it { should respond_to(:last_name) }
  it { should respond_to(:email) }
  it { should respond_to(:admin) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:full_name) }
  it { should respond_to(:authenticate) }

  it { should be_valid }

  it "should require an email address" do
    @user.email = " "
    @user.should_not be_valid
  end

  it "should require a unique email" do
    user_with_same_email = @user.dup
    user_with_same_email.email = @user.email
    user_with_same_email.save

    user_with_same_email.should_not be_valid
  end

  it "should require a first name" do
    @user.first_name = " "
    @user.should_not be_valid
  end

  it "should require a last name" do
    @user.last_name = " "
    @user.should_not be_valid
  end

  it "should return the correct full name" do
    full_name = "#{@user.first_name} #{@user.last_name}"
    @user.full_name.should eq(full_name)
  end

  describe "passwords" do
    
    describe "password validations" do

      it "should require a password" do
        @user.password = ""
        @user.password_confirmation = ""
        @user.should_not be_valid
      end

      it "should require a matching password confirmation" do
        @user.password_confirmation = "invalid"
        @user.should_not be_valid
      end
      
      it "should reject short passwords" do
        short = "a" * 5
        @user.password = @user.password_confirmation = short
        @user.should_not be_valid
      end    
    end
  end

  describe "return value of authenticate method" do
    before { @user.save }
    let(:found_user) { User.find_by_email(@user.email) }

    describe "with valid password" do
      it { should == found_user.authenticate(@user.password) }
    end

    describe "with invalid password" do
      let(:user_for_invalid_password) { found_user.authenticate("invalid") }

      it { should_not == user_for_invalid_password }
      specify { user_for_invalid_password.should be_false }
    end
  end
end
