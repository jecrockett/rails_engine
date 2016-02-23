require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do
  describe "#index" do
    it "responds with all merchants" do
      Merchant.create(name: "SteveO")
      Merchant.create(name: "Greg")

      get :index, format: :json
      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(merchants.first['name']).to eq 'SteveO'
      expect(merchants.last['name']).to eq 'Greg'
    end
  end

  describe "#show" do
    it "responds with specified merchant" do
      steve = Merchant.create(name: "SteveO")

      get :show, format: :json, id: steve.id
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(merchant['name']).to eq 'SteveO'
    end

  end
end
