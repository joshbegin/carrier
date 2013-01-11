require 'spec_helper'

describe "feeds/edit" do
  before(:each) do
    @feed = assign(:feed, stub_model(Feed,
      :name => "MyString",
      :notes => "MyText",
      :stage_feed_url => "MyString",
      :production_feed_url => "MyString",
      :company => nil,
      :feed_status => nil,
      :feed_frequency => nil,
      :feed_type => nil
    ))
  end

  # it "renders the edit feed form" do
  #     render
  # 
  #     # Run the generator again with the --webrat flag if you want to use webrat matchers
  #     assert_select "form", :action => feeds_path(@feed), :method => "post" do
  #       assert_select "input#feed_name", :name => "feed[name]"
  #       assert_select "textarea#feed_notes", :name => "feed[notes]"
  #       assert_select "input#feed_stage_feed_url", :name => "feed[stage_feed_url]"
  #       assert_select "input#feed_production_feed_url", :name => "feed[production_feed_url]"
  #       assert_select "input#feed_company", :name => "feed[company]"
  #       assert_select "input#feed_feed_status", :name => "feed[feed_status]"
  #       assert_select "input#feed_feed_frequency", :name => "feed[feed_frequency]"
  #       assert_select "input#feed_feed_type", :name => "feed[feed_type]"
  #     end
  # end
end
