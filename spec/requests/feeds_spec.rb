require 'spec_helper'

describe "Feeds:" do
  let(:user) { FactoryGirl.create(:active) }
  let(:admin) { FactoryGirl.create(:admin) }
  let(:company) { FactoryGirl.create(:company) }
  let(:feed) { FactoryGirl.create(:feed, company: company) }
    
  subject { page }
  
  describe "As an Admin," do
    before do 
      valid_signin(admin)
      feed.valid?
    end
    
    describe "index" do
      before { visit feeds_path }
      it { should have_selector('h3', text: "Feeds") }
      it { should have_selector('title', text: "Feeds") }
      
      it { should have_link('Add Feed') }
      it { should have_link('Feeds') }
      
      it { should have_content("#{feed.name}") }
      it { should have_content("#{feed.feed_type.name}") }
      it { should have_content("#{feed.company.name}") }
      it { should have_content("#{feed.feed_status.name}") }
      it { should have_content("#{feed.feed_frequency.name}") }
      it { should have_link('Edit') }
      it { should have_link('Delete') }
    end
    
    describe "show" do
      before do 
        visit feed_path(feed)
      end
      it { should have_selector('h3', text: "#{feed.company.name} - #{feed.feed_type.name} Details") }
      it { should have_selector('title', text: "Feed Details") }
      it { should have_content("#{feed.company.name}") }
      it { should have_content("#{feed.feed_status.name}") }
      it { should have_content("#{feed.feed_type.name}") }
      it { should have_content("#{feed.feed_frequency.name}") }
      it { should have_content("#{feed.name}") }
      it { should have_content("#{feed.notes}") }
      it { should have_content("#{feed.stage_feed_url}") }
      it { should have_content("#{feed.production_feed_url}") }
      it { should have_content("#{feed.production_start_date.strftime("%D")}") }
      it { should have_content("#{feed.production_end_date.strftime("%D")}") }
      it { should have_link('Edit') }
    end
    
    describe "new" do
      before do
        company = FactoryGirl.create(:company)
        visit new_feed_path 
        select("#{company.name}", from: 'feed_company_id')
        select("#{FeedType.first.name}", from: 'feed_feed_type_id')
        select("#{FeedStatus.first.name}", from: 'feed_feed_status_id')
        select("#{FeedFrequency.first.name}", from: 'feed_feed_frequency_id')
        fill_in "Name", with: "Test Feed"
      end
      it { should have_selector('h3', text: "New Feed") }
      it { should have_selector('title', text: "New Feed") }
      it "should allow creation of a new feed" do
        expect do
          click_button "Create Feed"
        end.to change(Feed, :count).by(1) 
      end
      
    end
    
    describe "edit" do
      before { visit edit_feed_path(feed) }
      it { should have_selector('h3', text: "Edit Feed") }
      it { should have_selector('title', text: "Edit Feed") }
      it { should have_button('Update Feed') }
    end
    
    describe "delete" do
    end
  end

  describe "As a non-admin," do
    before { valid_signin(user) }
    
    describe "index should be accessible" do
      before { visit feeds_path }
      it { should have_selector('h3', text: "Feeds") }
      it { should have_selector('title', text: "Feeds") }
      
      it { should_not have_link('Add Feed') }
      it { should have_link('Feeds') }
      
      it { should_not have_link('Edit') }
      it { should_not have_link('Delete') }
    end
    
    describe "show should be accessible" do
      before { visit feed_path(feed) } 
      it { should have_selector('h3', text: "#{feed.company.name} - #{feed.feed_type.name} Details") }
      it { should have_selector('title', text: "Feed Details") }
      
      it { should_not have_link('Edit') }

    end
    
    describe "new should not be accessible" do
      before { visit new_feed_path }
      it { should have_selector('h1', text: "Welcome!") }
    end
    
    describe "edit should not be accessible" do
      before { visit edit_feed_path(feed) }
      it { should have_selector('h1', text: "Welcome!") }
    end
    
    describe "delete" do
    end
  end
  
  describe "When not signed in," do
    
    describe "feeds link should not be visible" do
      before { visit root_path }
      it { should_not have_link('Feeds') }
    end

    describe "index should not be accessible" do
      before { visit feeds_path }
      it { should have_selector('h3', text: "Sign in") }
      it { should have_selector('div.alert.alert-warning', text: "Please log in first") }
    end
    
    describe "show should not be accessible" do
      before { visit feed_path(feed) } 
      it { should have_selector('h3', text: "Sign in") }
      it { should have_selector('div.alert.alert-warning', text: "Please log in first") }
    end
    
    describe "new should not be accessible" do
      before { visit new_feed_path }
      it { should have_selector('h3', text: "Sign in") }
      it { should have_selector('div.alert.alert-warning', text: "Please log in first") }
    end
    
    describe "edit should not be accessible" do
      before { visit edit_feed_path(feed) }
      it { should have_selector('h3', text: "Sign in") }
      it { should have_selector('div.alert.alert-warning', text: "Please log in first") }
    end
    
    describe "delete" do
    end
  end
end
