require 'rails_helper'

RSpec.describe Api::V1::Items::MerchantsController, type: :controller do
  fixtures :merchants, :items
  describe "#show" do
    it "responds with the merchant associated with a given item" do
      get :show, format: :json, id: 1
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['name']).to eq 'merchant_1'
    end
  end

end
