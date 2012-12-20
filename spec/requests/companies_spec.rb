require 'spec_helper'

describe "Companies" do
  describe "when logged in as non-admin" do
    before do
      sign_up_active
      visit signin_path
      fill_in "Email", with: "user2@email.com"
      fill_in "Password", with: "Password"
      click_button("Sign in")
      @company = FactoryGirl.create(:company)
      @parent = FactoryGirl.create(:parent_company)
      @company.parent_company_id = @parent.id
    end
    
    it "Carrier page should be accessible" do
      visit carriers_path
      page.should have_selector('h3', text: 'Carriers')
    end

    it "Exam page should be accessible" do
      visit exams_path
      page.should have_selector('h3', text: 'Exam Companies')
    end
    
    # it "Carrier page should have the correct columns" do
    #       visit carriers_path
    #       page.has_table?('Carriers', rows: [@company.parent_company.name, @company.name, @company.alias, @company.naic_code])
    #     end
    # shouldn't have New, Edit or Destroy links
  end
end
