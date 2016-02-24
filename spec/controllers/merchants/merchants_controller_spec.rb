require 'rails_helper'

RSpec.describe Api::V1::MerchantsController, type: :controller do
  fixtures :merchants
  describe "#index" do
    it "responds with all merchants" do
      get :index, format: :json
      merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(merchants.first['name']).to eq 'merchant_1'
      expect(merchants.last['name']).to eq 'merchant_2'
    end
  end

  describe "#show" do
    it "responds with specified merchant" do
      steve = merchants(:first)
      get :show, format: :json, id: steve.id
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(merchant['name']).to eq 'merchant_1'
    end

  end
end
