require "rails_helper"

RSpec.describe LinkSerializer, type: :serializer do
  let(:link) { create :link, original_url: "https://www.mercadolibre.com.mx/" }
  let(:serializer) { described_class.new(link) }
  let(:serialization) { ActiveModelSerializers::Adapter.create(serializer) }

  let(:subject) { JSON.parse(serialization.to_json) }

  it "include url attribute" do
  	expect(subject['original_url']).to eq("https://www.mercadolibre.com.mx/")
  end
end