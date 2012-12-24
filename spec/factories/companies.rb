FactoryGirl.define do
  factory :company do |f|
    f.sequence(:name) { |n| "Carrier_#{n}" }
    f.sequence(:alias) { |n| "Alias_#{n}" }
    f.company_type_id 1
    f.sequence(:address_line_1) { |n| "Line 1 #{n}" }
    f.sequence(:address_line_2) { |n| "Line 2 #{n}" }
    f.sequence(:address_line_3) { |n| "Line 3 #{n}" }
    f.sequence(:city) { |n| "City #{n}" }
    f.sequence(:zip) { |n| "Zip #{n}" }
    f.sequence(:url) { |n| "url #{n}" }
    f.sequence(:naic_code) { |n| "naic #{n}" }
    f.sequence(:ai_carrier_code) { |n| "ai code #{n}" }
    f.sequence(:notes) { |n| "notes #{n}" }
  end
end
