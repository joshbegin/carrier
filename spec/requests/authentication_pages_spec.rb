require 'spec_helper'

describe "Authentication" do

  subject { page }

  describe "signin page" do
    before { visit signin_path }

    it { should have_selector('h3',    text: 'Sign in') }
    it { should have_selector('title', text: 'Sign in') }
  end

  describe "signin" do
    # before { visit signin_path }

    describe "with invalid information" do
      before do
      	visit signin_path
      	click_button "Sign in"
      end

      it { should have_selector('title', text: 'Sign in') }
      it { should have_selector('div.alert.alert-error', text: 'Invalid') }
      it { should_not have_link('Sign out', href: signout_path) }
      
      describe "after visiting another page" do
        before { click_link "Sign in" }
        it { should_not have_selector('div.alert.alert-error') }
      end
    end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:active) }
      before do 
      	visit signup_path
      	fill_in "First name",                       with: "Second"
        fill_in "Last name",                        with: "User"
        fill_in "Email",                            with: "user2@email.com"
        fill_in "Password",                         with: "Password"
        fill_in "Confirm Password",                 with: "Password"
        # save_and_open_page
        click_button("Create User")
        User.find_by_email("user2@email.com").toggle!(:active)
        visit signin_path
        fill_in "Email",                            with: "user2@email.com"
        fill_in "Password",                         with: "Password"
        click_button("Sign in")
        # save_and_open_page
      end

      it { should have_selector('title', text: 'User details') }
      it { should have_link('Sign out', href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }

      describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
      end
    end

    describe "as inactive user" do
      # let(:user) { FactoryGirl.create(:user) }
      before do 
        visit signup_path
        fill_in "First name",                       with: "Second"
        fill_in "Last name",                        with: "User"
        fill_in "Email",                            with: "user2@email.com"
        fill_in "Password",                         with: "Password"
        fill_in "Confirm Password",                 with: "Password"
        # save_and_open_page
        click_button("Create User")
        visit signin_path
        fill_in "Email",                            with: "user2@email.com"
        fill_in "Password",                         with: "Password"
      end

      it "should not be possible" do
        click_button("Sign in")
        current_path.should eq(sessions_path)
      end
    end

    describe "as admin user" do
      before do
        visit signup_path
        fill_in "First name",                       with: "Second"
        fill_in "Last name",                        with: "User"
        fill_in "Email",                            with: "user2@email.com"
        fill_in "Password",                         with: "Password"
        fill_in "Confirm Password",                 with: "Password"
        click_button("Create User")
        user = User.find_by_email('user2@email.com')
        user.toggle!(:admin)
        user.toggle!(:active)
        visit signin_path
        fill_in "Email", with: "user2@email.com"
        fill_in "Password", with: "Password"
        click_button("Sign in")
      end
      
      it { should have_link('Users', href: users_path) }
      
      it "should be able to access Users page" do
        visit users_path
        page.should have_selector('h3', text: 'Users')
      end
    end

    describe "as non-admin user" do
      before do
        visit signup_path
        fill_in "First name",                       with: "Second"
        fill_in "Last name",                        with: "User"
        fill_in "Email",                            with: "user2@email.com"
        fill_in "Password",                         with: "Password"
        fill_in "Confirm Password",                 with: "Password"
        click_button("Create User")
        user = User.find_by_email('user2@email.com')
        user.toggle!(:active)
        visit signin_path
        fill_in "Email", with: "user2@email.com"
        fill_in "Password", with: "Password"
        click_button("Sign in")
      end
      
      it "should not be able to access Users page" do
        visit users_path
        page.should have_selector('h1', text: 'Welcome!')
      end
    end
  end
end