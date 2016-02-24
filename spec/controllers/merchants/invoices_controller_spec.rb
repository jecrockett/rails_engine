require 'rails_helper'

RSpec.describe Api::V1::Merchants::InvoicesController, type: :controller do
  fixtures :merchants, :invoices
  describe "#index" do
    it "responds with all invoices associated with a given merchant" do
      get :index, format: :json, id: 1
      merchant_invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_invoices.count).to eq 2
    end
  end
end
