require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::ItemsController, type: :controller do
  fixtures :invoice_items, :items
  describe "#show" do
    it "responds with the item associated with a given invoice_item" do
      get :show, format: :json, id: 1
      invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoice['id']).to eq 1
    end
  end
end
