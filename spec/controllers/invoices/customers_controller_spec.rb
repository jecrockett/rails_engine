require 'rails_helper'

RSpec.describe Api::V1::Invoices::CustomersController, type: :controller do
  fixtures :invoices, :customers
  describe "#show" do
    it "responds with the customer associated with a given invoice" do
      get :show, format: :json, id: 1
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['id']).to eq 1
      expect(customer['first_name']).to eq 'customer_1'
    end
  end
end
