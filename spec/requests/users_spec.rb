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
        
        it "should send the admin an email" do
          click_button "Create User"
          user = User.find_by_email("nospam@email.com")
          last_email.body.raw_source.should include user.full_name
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

      before do
        sign_up_admin
        visit signin_path
        fill_in "Email", with: "user2@email.com"
        fill_in "Password", with: "Password"
        click_button("Sign in")
        visit new_user_path
      end
      
      describe "with valid information" do
        before do
          fill_in "First name",                       with: "Third"
          fill_in "Last name",                        with: "User"
          fill_in "Email",                            with: "user3@email.com"
          fill_in "Password",                         with: "Password"
          fill_in "Confirm Password",                 with: "Password"
        end

        it "should create a user" do
          expect { click_button "Create User" }.to change(User, :count).by(1)
        end

        it "should be able to activate/deactivate user" do
          click_button "Create User"
          @inactive_user = User.find_by_email('user3@email.com')
          visit user_path(@inactive_user)
          # save_and_open_page
          click_link "Deactivate"
          # save_and_open_page
          @inactive_user = User.find_by_email('user3@email.com')
          @inactive_user.should_not be_active
          visit user_path(@inactive_user)
          click_link "Activate"
          @inactive_user = User.find_by_email('user3@email.com')
          @inactive_user.should be_active
        end
        
        it "should be able to add/remove admin rights user" do
          click_button "Create User"
          @nonadmin_user = User.find_by_email('user3@email.com')
          visit user_path(@nonadmin_user)
          # save_and_open_page
          click_link "Make Admin"
          # save_and_open_page
          @nonadmin_user = User.find_by_email('user3@email.com')
          @nonadmin_user.should be_admin
          visit user_path(@nonadmin_user)
          click_link "Remove Admin"
          @nonadmin_user = User.find_by_email('user3@email.com')
          @nonadmin_user.should_not be_admin
        end
        
        it "should send the user an email when activated" do
          click_button "Create User"
          @inactive_user = User.find_by_email('user3@email.com')
          last_email.body.raw_source.should include @inactive_user.first_name
          last_email.subject.should include "Welcome to the Carrier Site"
          last_email.to.should include @inactive_user.email
        end
        
        it "should not send admin an email notifying them of new user" do
          click_button "Create User"
          @inactive_user = User.find_by_email('user3@email.com')
          last_email.body.raw_source.should_not include @inactive_user.full_name
        end          
        
        it "should automatically create the user as active" do
          click_button "Create User"
          @new_user = User.find_by_email('user3@email.com')
          @new_user.should be_active
        end

        describe "after saving the user" do
          before { click_button "Create User" }
          
          it "should take the user to the Users page" do
            page.should have_selector('title', text: "Users")
            current_path.should eq(users_path)
          end
        end
        
        it "should be able to delete user"
                
        it "should not be able to delete self"
      end
    end

    describe "while logged in as non-admin" do
      # let(:user) { FactoryGirl.create(:user) }
      before do
        sign_up_active
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
    # let(:user) { FactoryGirl.create(:admin) }
      before do
        sign_up_admin
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