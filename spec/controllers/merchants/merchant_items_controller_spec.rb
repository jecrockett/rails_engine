require 'rails_helper'

RSpec.describe Api::V1::Merchants::ItemsController, type: :controller do
  fixtures :merchants, :items
  describe "#index" do
    it "responds with all items associated with a given merchant" do
      get :index, format: :json, id: 1
      merchant_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(merchant_items.count).to eq 2
      expect(merchant_items.first['name']).to eq 'item_1'
      expect(merchant_items.last['name']).to eq 'item_2'
    end
  end

end
