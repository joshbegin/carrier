FactoryGirl.define do
  factory :parent_company do |f|
    f.sequence(:name) { |n| "Carrier_#{n}" }
    f.sequence(:alias) { |n| "Alias_#{n}" }
  end
end
