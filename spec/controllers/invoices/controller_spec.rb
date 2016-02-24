require 'rails_helper'

RSpec.describe Api::V1::InvoicesController, type: :controller do
  fixtures :invoices
  describe "#index" do
    it "responds with all invoices" do
      get :index, format: :json
      invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(invoices.count).to eq 3
    end
  end

  describe "#show" do
    it "responds with specified invoice" do
      invoice = invoices(:first)
      get :show, format: :json, id: invoice.id
      found_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice['id']).to eq invoice.id
    end
  end
end
