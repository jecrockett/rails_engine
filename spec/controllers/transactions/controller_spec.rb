require 'rails_helper'

RSpec.describe Api::V1::TransactionsController, type: :controller do
  fixtures :transactions
  describe "#index" do
    it "responds with all transactions" do
      get :index, format: :json
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(transactions.count).to eq 3
      expect(transactions[0]['id']).to eq 1
      expect(transactions[1]['id']).to eq 2
    end
  end

  describe "#show" do
    it "responds with specified transaction" do
      transaction = transactions(:first)
      get :show, format: :json, id: transaction.id
      found_transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(found_transaction['id']).to eq transaction.id
    end
  end
end
