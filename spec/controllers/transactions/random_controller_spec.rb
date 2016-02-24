require 'rails_helper'

RSpec.describe Api::V1::Items::RandomController, type: :controller do
  fixtures :transactions
  describe "#show" do
    it "returns a random transaction" do
      get :show, format: :json
      random_transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(random_transaction.count).to eq 1
    end
  end
end
