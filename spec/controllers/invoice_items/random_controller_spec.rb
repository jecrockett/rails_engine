require 'rails_helper'

RSpec.describe Api::V1::Invoices::RandomController, type: :controller do
  fixtures :invoice_items
  describe "#show" do
    it "returns a random invoice_item" do
      get :show, format: :json
      random_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(random_invoice_item.count).to eq 1
    end
  end
end
