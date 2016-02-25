require 'rails_helper'

RSpec.describe Api::V1::Items::InvoiceItemsController, type: :controller do
  fixtures :items, :invoices, :invoice_items
  describe "#index" do
    it "responds with all invoices associated with a given merchant" do
      get :index, format: :json, id: 1
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq 2
      expect(invoice_items.first['unit_price']).to eq "100.0"
      expect(invoice_items.last['unit_price']).to eq "100.0"
    end
  end
end
