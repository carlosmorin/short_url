require "rails_helper"

RSpec.describe LinksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "api/links").to route_to("links#index")
    end

    it "routes to #show" do
      expect(get: "api/links/1").to route_to("links#show", id: "1")
    end


    it "routes to #create" do
      expect(post: "api/links").to route_to("links#create")
    end

    it "routes to #update via PUT" do
      expect(put: "api/links/1").to route_to("links#update", id: "1")
    end

    it "routes to #update via PATCH" do
      expect(patch: "api/links/1").to route_to("links#update", id: "1")
    end

    it "routes to #destroy" do
      expect(delete: "api/links/1").to route_to("links#destroy", id: "1")
    end
  end
end
