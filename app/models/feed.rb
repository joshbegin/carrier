class Feed < ActiveRecord::Base
  belongs_to :company
  belongs_to :feed_status
  belongs_to :feed_frequency
  belongs_to :feed_type
  attr_accessible :name, :notes, :production_end_date, :production_feed_url, :production_start_date, :stage_feed_url
end
