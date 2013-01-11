require 'faker'

FactoryGirl.define do
  factory :parent_company do |f|
    f.name { Faker::Company.name }
    f.alias { Faker::Company.catch_phrase }
  end
end
