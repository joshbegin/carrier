# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :user do |f|
    f.sequence(:email) { |n| "MyString_#{n}@abc.com" }
    f.first_name "MyString"
    f.sequence(:last_name) { |n| "LastName_#{n}" }
    f.password "Password"
    f.password_confirmation "Password"

    factory :admin do
    end
                                     
    factory :active do
    end
  end
end
