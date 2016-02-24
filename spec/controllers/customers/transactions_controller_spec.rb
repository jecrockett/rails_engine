require 'rails_helper'

RSpec.describe Api::V1::Customers::TransactionsController, type: :controller do
  fixtures :customers, :transactions
  describe "#index" do
    it "responds with all transactions associated with a given customer" do
      get :index, format: :json, id: 2
      customer_transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_transactions.count).to eq 2
    end
  end
end
