require 'spec_helper'

describe "Users" do
  
  describe "Sign up" do

    subject { page }

    describe "while not logged in" do

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

        it "should create the user as inactive" do
          click_button "Create User"
          @user = User.find_by_email('nospam@email.com')
          @user.should_not be_active
        end

        describe "after saving the user" do
          before { click_button "Create User" }
          
          it "should take the user to the confirmation page" do
            page.should have_selector('title', text: "Signup Confirmation")
          end
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

    describe "while logged in as admin" do

      let(:admin_user) { FactoryGirl.create(:admin) }
      before do
        # sign_in(admin_user)
        visit signup_path
        fill_in "First name",                       with: "Second"
        fill_in "Last name",                        with: "User"
        fill_in "Email",                            with: "user2@email.com"
        fill_in "Password",                         with: "Password"
        fill_in "Confirm Password",                 with: "Password"
        # save_and_open_page
        click_button("Create User")
        # User.find_by_email('user2@email.com').toggle!(:active)
        visit signin_path
        fill_in "Email", with: "user2@email.com"
        fill_in "Password", with: "Password"
        click_button("Sign in")
        visit new_user_path
      end
      
      describe "with valid information" do
        before do
          fill_in "First name",                       with: "Second"
          fill_in "Last name",                        with: "User"
          fill_in "Email",                            with: "user2@email.com"
          fill_in "Password",                         with: "Password"
          fill_in "Confirm Password",                 with: "Password"
        end

        it "should create a user" do
          expect { click_button "Create User" }.to change(User, :count).by(1)
        end

        it "should create the user as active" do
          click_button "Create User"
          @user = User.find_by_email('user2@email.com')
          @user.should be_active
        end

        describe "after saving the user" do
          before { click_button "Create User" }
          
          it "should take the user to the Users page" do
            page.should have_selector('title', text: "Users")
            current_path.should eq(users_path)
          end
        end
      end
    end

    describe "while logged in as non-admin" do
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
        # User.find_by_email('user2@email.com').toggle!(:active)
        visit signin_path
        fill_in "Email", with: "user2@email.com"
        fill_in "Password", with: "Password"
        click_button("Sign in")
      end
      it "should not be able to create new user" do
        visit new_user_path
        current_path.should_not eq(new_user_path)
        page.should_not have_button('Create User')
      end
    end
  end

  describe "Users page" do
    let(:user) { FactoryGirl.create(:admin) }
      before do
        visit signup_path
        fill_in "First name",                       with: "Second"
        fill_in "Last name",                        with: "User"
        fill_in "Email",                            with: "user2@email.com"
        fill_in "Password",                         with: "Password"
        fill_in "Confirm Password",                 with: "Password"
        # save_and_open_page
        click_button("Create User")
        User.find_by_email('user2@email.com').toggle!(:admin)
        User.find_by_email('user2@email.com').toggle!(:active)
        visit signin_path
        fill_in "Email", with: "user2@email.com"
        fill_in "Password", with: "Password"
        click_button("Sign in")
      end

    subject { page }

    before { visit users_path }

    it { should have_selector('th',     text: 'Name') }
    it { should have_selector('th',     text: 'Email') }
  end
end

# Only admins can delete users
# Admins can't delete themselves
# new users should not be logged in automatically
# need admin page to activate users
# need email to admin notifying of new user
# need email to user once they are approved

