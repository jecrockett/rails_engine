require 'rails_helper'

RSpec.describe Api::V1::Invoices::MerchantsController, type: :controller do
  fixtures :invoices, :merchants
  describe "#show" do
    it "responds with the merchant associated with a given invoice" do
      get :show, format: :json, id: 3
      merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant['id']).to eq 2
      expect(merchant['name']).to eq 'merchant_2'
    end
  end
end
