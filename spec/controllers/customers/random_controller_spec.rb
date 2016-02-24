require 'rails_helper'

RSpec.describe Api::V1::Customers::RandomController, type: :controller do
  fixtures :customers
  describe "#show" do
    it "returns a random customer" do
      get :show, format: :json
      random_customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(random_customer.count).to eq 1
    end
  end
end
