require 'spec_helper'

describe "Companies" do
  
  subject { page }
  
  describe "as Admin user" do
    
    before do
      sign_up_admin
      visit signin_path
      fill_in "Email", with: "user2@email.com"
      fill_in "Password", with: "Password"
      click_button("Sign in")
      @company = FactoryGirl.create(:company)
      @parent = FactoryGirl.create(:parent_company)
      @company.parent_company_id = @parent.id
      @company.save
    end

    it ", Carrier page should be accessible" do
      visit carriers_path
      page.should have_selector('h3', text: 'Carriers')
      page.should have_selector('title', text: 'Carriers')
      page.should have_link('Add Company', href: new_company_path)
    end

    it ", Exam page should be accessible" do
      visit exams_path
      page.should have_selector('h3', text: 'Exam Companies')
      page.should have_selector('title', text: 'Exam Companies')
      page.should have_link('Add Company', href: new_company_path)
    end
      
    it "should be able to view show pages" do
      visit company_path(@company)
      
      page.should have_selector('h3',     text: "#{@company.name} Details")
      page.should have_selector('title',  text: 'Company Details')
    end
    
    it "should be able to edit Companies" do
      visit edit_company_path(@company)
      
      page.should have_selector('h3',     text: "Edit #{@company.name}")
      page.should have_selector('title',  text: 'Edit Company')
    end

    it "should be able to add Companies" do
      visit new_company_path
      
      page.should have_selector('h3',     text: 'New Company')
      page.should have_selector('title',  text: 'New Company')
    end
  end
  
  describe "as non-admin user" do
    before do
      sign_up_active
      visit signin_path
      fill_in "Email", with: "user2@email.com"
      fill_in "Password", with: "Password"
      click_button("Sign in")
      @company = FactoryGirl.create(:company)
      @parent = FactoryGirl.create(:parent_company)
      @company.parent_company_id = @parent.id
      @company.save
    end
    
    it "Carrier page should be accessible" do
      visit carriers_path
      page.should have_selector('h3', text: 'Carriers')
      page.should have_selector('title', text: 'Carriers')
    end

    it "Exam page should be accessible" do
      visit exams_path
      page.should have_selector('h3', text: 'Exam Companies')
      page.should have_selector('title', text: 'Exam Companies')
    end
    
    it "should be able to view show pages" do
      puts @company.name
      puts @company.parent_company.name
      puts @parent.name
      visit company_path(@company)
      
      page.should have_selector('h3',     text: "#{@company.name} Details")
      page.should have_selector('title',  text: "#{@company.company_type.name} Details")
    end
    
    it "should not be able to edit Companies" do
      visit edit_company_path(@company)
      
      page.should have_selector('h1',     text: 'Welcome!')
    end

    it "should not be able to add Companies" do
      visit new_company_path
      
      page.should have_selector('h1',     text: 'Welcome!')
    end
  end
  
  describe "when not signed in" do
    before do
      @company = FactoryGirl.create(:company)
      @parent = FactoryGirl.create(:parent_company)
      @company.parent_company_id = @parent.id
    end
      
    it "Carrier page should not be accessible" do
      visit carriers_path
      page.should have_selector('h3',    text: 'Sign in')
      page.should have_content('Please log in first')
    end

    it "Exams page should not be accessible" do
      visit exams_path
      page.should have_selector('h3',    text: 'Sign in')
      page.should have_content('Please log in first')
    end
    
    it "should not be able to view show pages" do
      visit company_path(@company)
      page.should have_selector('h3',    text: 'Sign in')
      page.should have_content('Please log in first')
    end
    
    it "should not be able to edit Companies" do
      visit edit_company_path(@company)
      page.should have_selector('h3',    text: 'Sign in')
      page.should have_content('Please log in first')
    end
    
    it { should_not have_link('Carriers', href: carriers_path) }
    it { should_not have_link('Exam Companies', href: exams_path) }
  end 
    # it "Carrier page should have the correct columns" do
    #       visit carriers_path
    #       page.has_table?('Carriers', rows: [@company.parent_company.name, @company.name, @company.alias, @company.naic_code])
    #     end
    # shouldn't have New, Edit or Destroy links
end