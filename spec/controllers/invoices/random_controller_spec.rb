require 'rails_helper'

RSpec.describe Api::V1::Invoices::RandomController, type: :controller do
  fixtures :invoices
  describe "#show" do
    it "returns a random invoice" do
      get :show, format: :json
      random_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(random_invoice.count).to eq 1
    end
  end
end
