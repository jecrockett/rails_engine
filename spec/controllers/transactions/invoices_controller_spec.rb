require 'rails_helper'

RSpec.describe Api::V1::Transactions::InvoicesController, type: :controller do
  fixtures :transactions
  describe "#show" do
    it "responds with the invoice associated with a given transaction" do
      get :show, format: :json, id: 3
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['id']).to eq 3
    end
  end
end
