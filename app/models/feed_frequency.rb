class FeedFrequency < ActiveRecord::Base
  has_many :feeds
  attr_accessible :name
end
