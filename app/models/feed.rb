class Feed < ActiveRecord::Base
  belongs_to :company
  belongs_to :feed_status
  belongs_to :feed_frequency
  belongs_to :feed_type
  attr_accessible :name, :notes, :production_end_date, :production_feed_url, :production_start_date, :stage_feed_url, :feed_frequency_id, :feed_status_id, :feed_type_id, :company_id

  validates :feed_type_id, :feed_status_id, :company_id, presence: true

end
