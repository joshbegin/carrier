require 'spec_helper'

describe User do
  before(:each) do  
    @user = FactoryGirl.create(:active)
  end

  it "has a valid factory" do
    FactoryGirl.create(:user).should be_valid
    FactoryGirl.create(:active).should be_valid
    FactoryGirl.create(:admin).should be_valid
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
  it { should respond_to(:remember_token) }
  it { should respond_to(:active) }

  it { should be_valid }

  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it "should require a unique email" do
    user_with_same_email = @user.dup
    user_with_same_email.email = @user.email
    user_with_same_email.save

    user_with_same_email.should_not be_valid
  end

  it "is invalid without a first_name" do
    FactoryGirl.build(:user, first_name: nil).should_not be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:user, last_name: nil).should_not be_valid
  end

  it "should return the correct full name" do
    full_name = "#{@user.first_name} #{@user.last_name}"
    @user.full_name.should eq(full_name)
  end

  describe "passwords" do
    
    describe "password validations" do

      it "is invalid without a password" do
        FactoryGirl.build(:user, password: nil).should_not be_valid
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

  describe "remember token" do
    its(:remember_token) { should_not be_blank }
  end
  
  # describe "#send_password_reset" do
  #    let(:user) { FactoryGirl.create(:user) }
  # 
  #    it "generates a unique password_reset_token each time" do
  #      user.send_password_reset
  #      last_token = user.password_reset_token
  #      user.send_password_reset
  #      user.password_reset_token.should_not eq(last_token)
  #    end
  # 
  #    it "saves the time the password reset was sent" do
  #      user.send_password_reset
  #      user.reload.password_reset_sent_at.should be_present
  #    end
  # 
  #    it "delivers email to user" do
  #      user.send_password_reset
  #      last_email.to.should include (user.email)
  #    end
  #  end
end
