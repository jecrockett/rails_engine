require 'rails_helper'

RSpec.describe Api::V1::Invoices::ItemsController, type: :controller do
  fixtures :invoices, :items
  describe "#index" do
    it "responds with all items associated with a given invoice" do
      get :index, format: :json, id: 2
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 2
      expect(items[0]['id']).to eq 1
      expect(items[1]['id']).to eq 2
    end
  end
end
