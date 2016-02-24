require 'rails_helper'

RSpec.describe Api::V1::ItemsController, type: :controller do
  fixtures :items
  describe "#index" do
    it "responds with all items" do
      get :index, format: :json
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(items.count).to eq 2
      expect(items[0]['name']).to eq 'item_1'
      expect(items[1]['name']).to eq 'item_2'
    end
  end

  describe "#show" do
    it "responds with specified item" do
      thing = items(:first)
      get :show, format: :json, id: thing.id
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(response).to have_http_status(200)
      expect(item['name']).to eq thing.name
    end

  end
end
