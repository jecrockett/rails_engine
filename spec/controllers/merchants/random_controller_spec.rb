require 'rails_helper'

RSpec.describe Api::V1::Merchants::RandomController, type: :controller do
  fixtures :merchants
  describe "#show" do
    it "returns a random merchant" do
      get :show, format: :json
      random_merchant = JSON.parse(response.body)

      expect(response).to be_success
      expect(random_merchant.count).to eq 1
    end
  end
end
