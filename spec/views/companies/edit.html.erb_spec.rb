# require 'spec_helper'
# 
# describe "companies/edit" do
#   before(:each) do
#     @company = assign(:company, stub_model(Company,
#       :parent_company => "",
#       :company_type => "",
#       :state => "",
#       :name => "MyString",
#       :alias => "MyString",
#       :address_line_1 => "MyString",
#       :address_line_2 => "MyString",
#       :address_line_3 => "MyString",
#       :city => "MyString",
#       :zip => "MyString",
#       :url => "MyString",
#       :naic_code => "MyString",
#       :ai_carrier_code => "MyString",
#       :notes => "MyText"
#     ))
#   end
# 
#   it "renders the edit company form" do
#     render
# 
#     # Run the generator again with the --webrat flag if you want to use webrat matchers
#     assert_select "form", :action => companies_path(@company), :method => "post" do
#       assert_select "input#company_parent_company", :name => "company[parent_company]"
#       assert_select "input#company_company_type", :name => "company[company_type]"
#       assert_select "input#company_state", :name => "company[state]"
#       assert_select "input#company_name", :name => "company[name]"
#       assert_select "input#company_alias", :name => "company[alias]"
#       assert_select "input#company_address_line_1", :name => "company[address_line_1]"
#       assert_select "input#company_address_line_2", :name => "company[address_line_2]"
#       assert_select "input#company_address_line_3", :name => "company[address_line_3]"
#       assert_select "input#company_city", :name => "company[city]"
#       assert_select "input#company_zip", :name => "company[zip]"
#       assert_select "input#company_url", :name => "company[url]"
#       assert_select "input#company_naic_code", :name => "company[naic_code]"
#       assert_select "input#company_ai_carrier_code", :name => "company[ai_carrier_code]"
#       assert_select "textarea#company_notes", :name => "company[notes]"
#     end
#   end
# end
