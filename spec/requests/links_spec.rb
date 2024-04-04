require 'rails_helper'

RSpec.describe "/links", type: :request do

  let(:valid_attributes) do
    {
      original_url: "https://www.mercadolibre.com.mx/aire-acondicionado-hisense-mini-split-frio-12000-btu-blanco-110v-ac121td/p/MLM19166046#reco_item_pos=1&reco_backend=item_decorator&reco_backend_type=function&reco_client=home_items-decorator-legacy&reco_id=ced01213-872d-455a-9f40-7531889d8619&c_id=/home/navigation-trends-recommendations/element&c_uid=a196d129-857a-4e2d-9925-b96924dda6db&da_id=navigation_trend&da_position=1&id_origin=/home/dynamic_access&da_sort_algorithm=ranker"
    }
  end

  let(:invalid_attributes) do
    {
      original_url: nil
    }
  end

  let(:valid_headers) {
    {}
  }

  describe "GET api/index" do
    it "renders a successful response" do
      get links_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "GET api/show/:id" do
    let(:link) { create :link }

    it "renders a successful response" do
      get link_url(link.id), as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Link" do
        expect {
          post links_url,
               params: { link: valid_attributes }, headers: valid_headers, as: :json
        }.to change(Link, :count).by(1)
      end

      it "renders a JSON response with the new link" do
        post links_url,
             params: { link: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Link" do
        expect {
          post links_url,
               params: { link: invalid_attributes }, as: :json
        }.to change(Link, :count).by(0)
      end

      it "renders a JSON response with errors for the new link" do
        post links_url,
             params: { link: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) do 
        {
          original_url: "https://www.mercadolibre.com.mx/aire-acondicionado-hisense-mini-split-frio-12000-btu-blanco-110v-ac121td"
        }
      end

      it "updates the requested link" do
        link = Link.create! valid_attributes
        patch link_url(link),
              params: { link: new_attributes }, headers: valid_headers, as: :json
        link.reload
        skip("Add assertions for updated state")
      end

      it "renders a JSON response with the link" do
        link = Link.create! valid_attributes
        patch link_url(link),
              params: { link: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the link" do
        link = Link.create! valid_attributes
        patch link_url(link),
              params: { link: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested link" do
      link = Link.create! valid_attributes
      expect {
        delete link_url(link), headers: valid_headers, as: :json
      }.to change(Link, :count).by(-1)
    end
  end
end
