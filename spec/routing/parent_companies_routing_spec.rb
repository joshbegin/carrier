require "spec_helper"

describe ParentCompaniesController do
  describe "routing" do

    it "routes to #index" do
      get("/parent_companies").should route_to("parent_companies#index")
    end

    it "routes to #new" do
      get("/parent_companies/new").should route_to("parent_companies#new")
    end

    it "routes to #show" do
      get("/parent_companies/1").should route_to("parent_companies#show", :id => "1")
    end

    it "routes to #edit" do
      get("/parent_companies/1/edit").should route_to("parent_companies#edit", :id => "1")
    end

    it "routes to #create" do
      post("/parent_companies").should route_to("parent_companies#create")
    end

    it "routes to #update" do
      put("/parent_companies/1").should route_to("parent_companies#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/parent_companies/1").should route_to("parent_companies#destroy", :id => "1")
    end

  end
end
