require 'faker'

FactoryGirl.define do
  factory :company do |f|
    f.name { Faker::Company.name }
    f.alias { Faker::Company.catch_phrase }
    f.company_type_id 1
    f.address_line_1 { Faker::Address.street_address }
    f.address_line_2 { Faker::Address.secondary_address }
    f.address_line_3 { Faker::Address.secondary_address }
    f.city { Faker::Address.city }
    f.zip { Faker::Address.zip_code }
    f.url { Faker::Internet.url }
    f.sequence(:naic_code) { |n| "naic #{n}" }
    f.sequence(:ai_carrier_code) { |n| "ai code #{n}" }
    f.notes { Faker::Lorem.paragraph }
  end
end
