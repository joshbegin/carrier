require 'spec_helper'

describe "feeds/show" do
  before(:each) do
    @feed = assign(:feed, stub_model(Feed,
      :name => "Name",
      :notes => "MyText",
      :stage_feed_url => "Stage Feed Url",
      :production_feed_url => "Production Feed Url",
      :company => nil,
      :feed_status => nil,
      :feed_frequency => nil,
      :feed_type => nil
    ))
  end

  # it "renders attributes in <p>" do
  #    render
  #    # Run the generator again with the --webrat flag if you want to use webrat matchers
  #    rendered.should match(/Name/)
  #    rendered.should match(/MyText/)
  #    rendered.should match(/Stage Feed Url/)
  #    rendered.should match(/Production Feed Url/)
  #    rendered.should match(//)
  #    rendered.should match(//)
  #    rendered.should match(//)
  #    rendered.should match(//)
  #  end
end
