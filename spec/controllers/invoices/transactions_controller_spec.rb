require 'rails_helper'

RSpec.describe Api::V1::Invoices::TransactionsController, type: :controller do
  fixtures :invoices, :transactions
  describe "#index" do
    it "responds with all transactions associated with a given invoice" do
      get :index, format: :json, id: 2
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq 1
      expect(transactions.first['id']).to eq 2
    end
  end
end
