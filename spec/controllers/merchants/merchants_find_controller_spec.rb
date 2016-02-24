require 'rails_helper'

RSpec.describe Api::V1::Merchants::FindController, type: :controller do
  fixtures :merchants
  describe '#show' do
    it "finds by id" do
      steve = merchants(:first)
      get :show, format: :json, id: steve.id
      found_merchant = JSON.parse(response.body)
      expect(response).to be_success
      expect(found_merchant['name']).to eq steve.name
    end

    it "finds by name" do
      steve = merchants(:first)
      get :show, format: :json, name: steve.name
      found_merchant = JSON.parse(response.body)
      expect(response).to be_success
      expect(found_merchant['name']).to eq steve.name
    end

    it "finds by created_at" do
      steve = merchants(:first)
      get :show, format: :json, created_at: steve.created_at
      found_merchant = JSON.parse(response.body)
      expect(response).to be_success
      expect(found_merchant['name']).to eq steve.name
    end

    it "finds by updated_at" do
      steve = merchants(:first)
      get :show, format: :json, updated_at: steve.updated_at
      found_merchant = JSON.parse(response.body)
      expect(response).to be_success
      expect(found_merchant['name']).to eq steve.name
    end
  end

  describe "#index" do
    it "finds all by id" do
      get :index, format: :json, id: 1
      found_merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_merchants.first['name']).to eq 'merchant_1'
    end

    it "finds all by name" do
      get :index, format: :json, name: 'merchant_1'
      found_merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_merchants.first['name']).to eq 'merchant_1'
    end

    it "finds all by created_at" do
      get :index, format: :json, created_at: "2012-03-27 14:53:59"
      found_merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_merchants.count).to eq 2
      expect(found_merchants.first['name']).to eq 'merchant_1'
      expect(found_merchants.last['name']).to eq 'merchant_2'
    end

    it "finds all by updated_at" do
      get :index, format: :json, updated_at: "2012-03-27 14:53:59"
      found_merchants = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_merchants.count).to eq 2
      expect(found_merchants.first['name']).to eq 'merchant_1'
      expect(found_merchants.last['name']).to eq 'merchant_2'
    end
  end
end
