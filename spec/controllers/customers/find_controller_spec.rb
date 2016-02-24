require 'rails_helper'

RSpec.describe Api::V1::Customers::FindController, type: :controller do
  fixtures :customers
  describe '#show' do
    it "finds by id" do
      steve = customers(:first)

      get :show, format: :json, id: steve.id
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['first_name']).to eq steve.first_name
    end

    it "finds by first_name" do
      steve = customers(:first)

      get :show, format: :json, first_name: steve.first_name
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['first_name']).to eq steve.first_name
    end

    it "finds by last_name" do
      steve = customers(:first)

      get :show, format: :json, last_name: steve.last_name
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['last_name']).to eq steve.last_name
    end

    it "finds by created_at" do
      steve = customers(:first)

      get :show, format: :json, created_at: steve.created_at
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['first_name']).to eq steve.first_name
    end

    it "finds by updated_at" do
      steve = customers(:first)

      get :show, format: :json, updated_at: steve.updated_at
      customer = JSON.parse(response.body)

      expect(response).to be_success
      expect(customer['first_name']).to eq steve.first_name
    end
  end

  describe "#index" do
    it "finds all by id" do
      get :index, format: :json, id: 1
      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.first['first_name']).to eq 'customer_1'
    end

    it "finds all by first_name" do
      get :index, format: :json, first_name: 'customer_1'
      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.first['first_name']).to eq 'customer_1'
    end

    it "finds all by last_name" do
      get :index, format: :json, last_name: 'customer_one'
      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.first['first_name']).to eq 'customer_1'
    end

    it "finds all by created_at" do
      get :index, format: :json, created_at: "2012-03-27 14:54:10"
      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.count).to eq 2
      expect(customers.first['first_name']).to eq 'customer_2'
      expect(customers.last['first_name']).to eq 'customer_3'
    end

    it "finds all by updated_at" do
      get :index, format: :json, updated_at: "2012-03-27 14:54:10"
      customers = JSON.parse(response.body)

      expect(response).to be_success
      expect(customers.count).to eq 2
      expect(customers.first['first_name']).to eq 'customer_2'
      expect(customers.last['first_name']).to eq 'customer_3'
    end
  end
end
