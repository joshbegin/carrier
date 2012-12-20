# require 'spec_helper'
# 
# describe "companies/index" do
#   before(:each) do
#     assign(:companies, [
#       stub_model(Company,
#         :parent_company => "",
#         :company_type => "",
#         :state => "",
#         :name => "Name",
#         :alias => "Alias",
#         :address_line_1 => "Address Line 1",
#         :address_line_2 => "Address Line 2",
#         :address_line_3 => "Address Line 3",
#         :city => "City",
#         :zip => "Zip",
#         :url => "Url",
#         :naic_code => "Naic Code",
#         :ai_carrier_code => "Ai Carrier Code",
#         :notes => "MyText"
#       ),
#       stub_model(Company,
#         :parent_company => "",
#         :company_type => "",
#         :state => "",
#         :name => "Name",
#         :alias => "Alias",
#         :address_line_1 => "Address Line 1",
#         :address_line_2 => "Address Line 2",
#         :address_line_3 => "Address Line 3",
#         :city => "City",
#         :zip => "Zip",
#         :url => "Url",
#         :naic_code => "Naic Code",
#         :ai_carrier_code => "Ai Carrier Code",
#         :notes => "MyText"
#       )
#     ])
#   end
# 
#   it "renders a list of companies" do
#     render
#     # Run the generator again with the --webrat flag if you want to use webrat matchers
#     assert_select "tr>td", :text => "".to_s, :count => 2
#     assert_select "tr>td", :text => "".to_s, :count => 2
#     assert_select "tr>td", :text => "".to_s, :count => 2
#     assert_select "tr>td", :text => "Name".to_s, :count => 2
#     assert_select "tr>td", :text => "Alias".to_s, :count => 2
#     assert_select "tr>td", :text => "Address Line 1".to_s, :count => 2
#     assert_select "tr>td", :text => "Address Line 2".to_s, :count => 2
#     assert_select "tr>td", :text => "Address Line 3".to_s, :count => 2
#     assert_select "tr>td", :text => "City".to_s, :count => 2
#     assert_select "tr>td", :text => "Zip".to_s, :count => 2
#     assert_select "tr>td", :text => "Url".to_s, :count => 2
#     assert_select "tr>td", :text => "Naic Code".to_s, :count => 2
#     assert_select "tr>td", :text => "Ai Carrier Code".to_s, :count => 2
#     assert_select "tr>td", :text => "MyText".to_s, :count => 2
#   end
# end
