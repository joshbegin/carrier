# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "MyString_#{n}@abc.com" }
    first_name "MyString"
    sequence(:last_name) { |n| "LastName_#{n}" }
    password "Password"
    password_confirmation "Password"

    factory :admin do
      admin true
    end

    factory :active do
      active true
    end
  end
end
