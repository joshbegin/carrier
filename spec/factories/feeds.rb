require 'faker'

FactoryGirl.define do
  factory :feed do |f|
    f.name { Faker::Company.name }
    f.company_id 1
    f.feed_status_id 1
    f.feed_frequency_id 1
    f.feed_type_id 1
    f.stage_feed_url { Faker::Internet.url }
    f.production_feed_url { Faker::Internet.url }
    f.production_start_date "#{Date.today - 1.year}"
    f.production_end_date "#{Date.today}"
    f.notes { Faker::Lorem.paragraph }
  end
end
