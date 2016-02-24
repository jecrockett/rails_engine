require 'rails_helper'

RSpec.describe Api::V1::CustomersController, type: :controller do
  fixtures :customers
  describe "#index" do
    it "responds with all customers" do
      get :index, format: :json
      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.first['first_name']).to eq 'customer_1'
      expect(customers.last['first_name']).to eq 'customer_3'
    end
  end

  describe "#show" do
    it "responds with specified customer" do
      steve = customers(:first)
      get :show, format: :json, id: steve.id
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['first_name']).to eq 'customer_1'
    end

  end
end
