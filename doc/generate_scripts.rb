rails g scaffold User email:string first_name:string last_name:string admin:boolean password_digest:string
rails g scaffold Feed name notes:text stage_feed_url production_feed_url production_start_date:datetime production_end_date:datetime company:references feed_status:references feed_frequency:references feed_type:references
rails g model FeedStatus name
rails g model FeedFrequency name
rails g model FeedType name

# setup db in test:
# rake db:setup RAILS_ENV=test