require 'spec_helper'

describe "ParentCompanies" do
  let(:parent_company) { FactoryGirl.create(:parent_company) }
  let(:company) { FactoryGirl.create(:company)}
  
  subject { page }
  
  describe "as Admin user" do
    
    before do
      sign_up_admin
      visit signin_path
      fill_in "Email", with: "user2@email.com"
      fill_in "Password", with: "Password"
      click_button("Sign in")
      company.parent_company_id = parent_company.id
      company.save
    end

    it "should be able to access Parent Companies (index) page" do
      visit parent_companies_path

      page.should have_selector('h3',    text: 'Parent Companies')
      page.should have_selector('title', text: 'Parent Companies')
    end
    
    it "should be able to view show pages" do
      visit parent_company_path(parent_company)
      
      page.should have_selector('h3',     text: "#{parent_company.name}")
      page.should have_selector('title',  text: 'Parent Company Details')
    end
    
    it "should be able to edit Parent Companies" do
      visit edit_parent_company_path(parent_company)
      
      page.should have_selector('h3',     text: "Edit #{parent_company.name}")
      page.should have_selector('title',  text: 'Edit Parent Company')
    end

    it "should be able to add Parent Companies" do
      visit new_parent_company_path
      
      page.should have_selector('h3',     text: 'New Parent Company')
      page.should have_selector('title',  text: 'New Parent Company')
    end
    
    it { should have_link('Parent Companies', href: parent_companies_path) }
    
    it "should display the correct child carriers" do
      visit parent_company_path(parent_company)
      page.should have_content("#{company.naic_code}")
    end
  end
  
  describe "as non-admin user" do
    before do
      sign_up_active
      visit signin_path
      fill_in "Email", with: "user2@email.com"
      fill_in "Password", with: "Password"
      click_button("Sign in")
    end
    
    it "should be able to access Parent Companies (index) page" do
      visit parent_companies_path

      page.should have_selector('h3',    text: 'Parent Companies')
      page.should have_selector('title', text: 'Parent Companies')
    end
    
    it "should be able to view show pages" do
      visit parent_company_path(parent_company)
      
      page.should have_selector('h3',     text: "#{parent_company.name}")
      page.should have_selector('title',  text: 'Parent Company Details')
    end
    
    it "should not be able to edit Parent Companies" do
      visit edit_parent_company_path(parent_company)
      
      page.should have_selector('h1',     text: 'Welcome!')
    end
    
    it "should not be able to add Parent Companies" do
      visit new_parent_company_path
      
      page.should have_selector('h1',     text: 'Welcome!')
    end
    
    it { should have_link('Parent Companies', href: parent_companies_path) }
  end
  
  describe "when not signed in" do
    it "should not be able to access Parent Companies (index) page" do
      visit parent_companies_path
      page.should have_selector('h3',    text: 'Sign in')
      page.should have_content('Please log in first')
    end
    
    it "should not be able to view show pages" do
      visit parent_company_path(parent_company)
      page.should have_selector('h3',    text: 'Sign in')
      page.should have_content('Please log in first')
    end
    
    it "should not be able to edit Parent Companies" do
      visit edit_parent_company_path(parent_company)
      page.should have_selector('h3',    text: 'Sign in')
      page.should have_content('Please log in first')
    end
    
    it { should_not have_link('Parent Companies', href: parent_companies_path) }
  end
end
