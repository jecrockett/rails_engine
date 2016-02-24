require 'rails_helper'

RSpec.describe Api::V1::InvoiceItemsController, type: :controller do
  fixtures :invoice_items
  describe "#index" do
    it "responds with all invoice_items" do
      get :index, format: :json
      invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice_items.count).to eq 4
    end
  end

  describe "#show" do
    it "responds with specified invoice_item" do
      invoice_item = invoice_items(:first)
      get :show, format: :json, id: invoice_item.id
      found_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_item['id']).to eq invoice_item.id
    end

  end
end
