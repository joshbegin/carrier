include ApplicationHelper

def valid_signin(user)
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  click_button "Sign in"
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

def sign_in user
  visit signin_path
  fill_in "Email",    with: user.email
  fill_in "Password", with: user.password
  # save_and_open_page
  click_link "Sign in"
  # save_and_open_page
  # Sign in when not using Capybara as well.
  cookies[:remember_token] = user.remember_token
end

def sign_up_admin
	visit signup_path
	fill_in "First name",                       with: "Second"
  fill_in "Last name",                        with: "User"
  fill_in "Email",                            with: "user2@email.com"
  fill_in "Password",                         with: "Password"
  fill_in "Confirm Password",                 with: "Password"
  # save_and_open_page
  click_button("Create User")
  user = User.find_by_email("user2@email.com")
  user.toggle!(:active)
  user.toggle!(:admin)
end

def sign_up_active
	visit signup_path
	fill_in "First name",                       with: "Second"
  fill_in "Last name",                        with: "User"
  fill_in "Email",                            with: "user2@email.com"
  fill_in "Password",                         with: "Password"
  fill_in "Confirm Password",                 with: "Password"
  # save_and_open_page
  click_button("Create User")
  user = User.find_by_email("user2@email.com")
  user.toggle!(:active)
end

def sign_up_inactive
	visit signup_path
	fill_in "First name",                       with: "Second"
  fill_in "Last name",                        with: "User"
  fill_in "Email",                            with: "user2@email.com"
  fill_in "Password",                         with: "Password"
  fill_in "Confirm Password",                 with: "Password"
  # save_and_open_page
  click_button("Create User")
end

RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.should have_selector('div.alert.alert-error', text: message)
  end
end