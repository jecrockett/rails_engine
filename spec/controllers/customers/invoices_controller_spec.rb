require 'rails_helper'

RSpec.describe Api::V1::Customers::InvoicesController, type: :controller do
  fixtures :customers, :invoices
  describe "#index" do
    it "responds with all invoices associated with a given customer" do
      get :index, format: :json, id: 2
      customer_invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer_invoices.count).to eq 2
    end
  end
end
