require 'spec_helper'

describe "Users" do
  
  describe "User Sign up" do

    subject { page }

    before { visit new_user_path }

    describe "with valid information" do
      before do
        fill_in "First name",                       with: "John"
        fill_in "Last name",                        with: "Jingleheimer"
        fill_in "Email", 							              with: "nospam@email.com"
        fill_in "Password", 						            with: "Password"
        fill_in "Confirm Password",      			      with: "Password"
      end

      it "should create a user" do
        expect { click_button "Create User" }.to change(User, :count).by(1)
      end

      describe "after saving the user" do
        before { click_button "Create User" }
        let(:user) { User.find_by_email('nospam@email.com') }

        #it { should have_selector('title', text: "User details") }
        #it { should have_selector('div.alert.alert-success', text: 'successfully created.') }
        # it { should have_link('Log out') }
      end
    end
    
    describe "with invalid information" do
      it "should not create a user" do
        expect { click_button "Create User" }.not_to change(User, :count)
      end

      describe "after submission" do
        before { click_button "Create User" }

        #it { should have_selector('title', text: 'Users') }
        #it { should have_content('New user') }
      end
    end
  end

  describe "Users page" do

    subject { page }

    before { visit users_path }

    it { should have_selector('th',     text: 'Name') }
    it { should have_selector('th',     text: 'Email') }
  end
end
