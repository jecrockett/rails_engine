require 'rails_helper'

RSpec.describe Api::V1::Invoices::InvoiceItemsController, type: :controller do
  fixtures :invoices, :invoice_items
  describe "#index" do
    it "responds with all invoice_items associated with a given invoice" do
      get :index, format: :json, id: 2
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq 2
      expect(invoice_items.first['quantity']).to eq 2
    end
  end
end
