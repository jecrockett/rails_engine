require 'rails_helper'

RSpec.describe Api::V1::Items::FindController, type: :controller do
  fixtures :items
  describe '#show' do
    it "finds by id" do
      thing = items(:first)

      get :show, format: :json, id: thing.id
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq thing.name
    end

    it "finds by name" do
      thing = items(:first)

      get :show, format: :json, name: thing.name
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq thing.name
    end

    it "finds by description" do
      thing = items(:first)

      get :show, format: :json, description: thing.description
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq thing.name
    end

    # it "finds by unit price" do
    #   thing = items(:first)
    #
    #   get :show, format: :json, unit_price: "2"
    #   item = JSON.parse(response.body)
    #
    #   expect(response).to be_success
    #   expect(item['unit_price']).to eq '2'
    #
    # end

    it "finds by created_at" do
      thing = items(:first)

      get :show, format: :json, created_at: thing.created_at
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq thing.name
    end

    it "finds by updated_at" do
      thing = items(:first)

      get :show, format: :json, updated_at: thing.updated_at
      item = JSON.parse(response.body)

      expect(response).to be_success
      expect(item['name']).to eq thing.name
    end
  end

  describe "#index" do
    it "finds all by id" do
      get :index, format: :json, id: 1
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first['name']).to eq 'item_1'
    end

    it "finds all by name" do
      get :index, format: :json, name: 'item_1'
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first['name']).to eq 'item_1'
    end

    it "finds all by created_at" do
      get :index, format: :json, created_at: "2012-03-27 14:53:59"
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.first['name']).to eq 'item_1'
      expect(items.last['name']).to eq 'item_2'
    end

    it "finds all by updated_at" do
      get :index, format: :json, updated_at: "2012-03-27 14:53:59"
      items = JSON.parse(response.body)

      expect(response).to be_success
      expect(items.count).to eq 2
      expect(items.first['name']).to eq 'item_1'
      expect(items.last['name']).to eq 'item_2'
    end
  end
end
