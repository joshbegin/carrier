# require 'spec_helper'
# 
# describe "companies/show" do
#   before(:each) do
#     @company = assign(:company, stub_model(Company,
#       :parent_company => "",
#       :company_type => "",
#       :state => "",
#       :name => "Name",
#       :alias => "Alias",
#       :address_line_1 => "Address Line 1",
#       :address_line_2 => "Address Line 2",
#       :address_line_3 => "Address Line 3",
#       :city => "City",
#       :zip => "Zip",
#       :url => "Url",
#       :naic_code => "Naic Code",
#       :ai_carrier_code => "Ai Carrier Code",
#       :notes => "MyText"
#     ))
#   end
# 
#   it "renders attributes in <p>" do
#     render
#     # Run the generator again with the --webrat flag if you want to use webrat matchers
#     rendered.should match(//)
#     rendered.should match(//)
#     rendered.should match(//)
#     rendered.should match(/Name/)
#     rendered.should match(/Alias/)
#     rendered.should match(/Address Line 1/)
#     rendered.should match(/Address Line 2/)
#     rendered.should match(/Address Line 3/)
#     rendered.should match(/City/)
#     rendered.should match(/Zip/)
#     rendered.should match(/Url/)
#     rendered.should match(/Naic Code/)
#     rendered.should match(/Ai Carrier Code/)
#     rendered.should match(/MyText/)
#   end
# end
