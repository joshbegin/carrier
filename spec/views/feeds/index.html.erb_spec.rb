require 'spec_helper'

describe "feeds/index" do
  before(:each) do
    assign(:feeds, [
      stub_model(Feed,
        :name => "Name",
        :notes => "MyText",
        :stage_feed_url => "Stage Feed Url",
        :production_feed_url => "Production Feed Url",
        :company => nil,
        :feed_status => nil,
        :feed_frequency => nil,
        :feed_type => nil
      ),
      stub_model(Feed,
        :name => "Name",
        :notes => "MyText",
        :stage_feed_url => "Stage Feed Url",
        :production_feed_url => "Production Feed Url",
        :company => nil,
        :feed_status => nil,
        :feed_frequency => nil,
        :feed_type => nil
      )
    ])
  end

  # it "renders a list of feeds" do
  #    render
  #    # Run the generator again with the --webrat flag if you want to use webrat matchers
  #    assert_select "tr>td", :text => "Name".to_s, :count => 2
  #    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  #    assert_select "tr>td", :text => "Stage Feed Url".to_s, :count => 2
  #    assert_select "tr>td", :text => "Production Feed Url".to_s, :count => 2
  #    assert_select "tr>td", :text => nil.to_s, :count => 2
  #    assert_select "tr>td", :text => nil.to_s, :count => 2
  #    assert_select "tr>td", :text => nil.to_s, :count => 2
  #    assert_select "tr>td", :text => nil.to_s, :count => 2
  #  end
end
