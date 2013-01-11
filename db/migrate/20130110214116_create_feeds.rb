class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.string :name
      t.text :notes
      t.string :stage_feed_url
      t.string :production_feed_url
      t.datetime :production_start_date
      t.datetime :production_end_date
      t.references :company
      t.references :feed_status
      t.references :feed_frequency
      t.references :feed_type

      t.timestamps
    end
    add_index :feeds, :company_id
    add_index :feeds, :feed_status_id
    add_index :feeds, :feed_frequency_id
    add_index :feeds, :feed_type_id
  end
end
