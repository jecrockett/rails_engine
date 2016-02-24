require 'rails_helper'

RSpec.describe Api::V1::Transactions::FindController, type: :controller do
  fixtures :transactions
  describe '#show' do
    it "finds by id" do
      thing = transactions(:first)

      get :show, format: :json, id: thing.id
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['id']).to eq thing.id
    end

    it "finds by invoice_id" do
      thing = transactions(:first)

      get :show, format: :json, invoice_id: thing.invoice_id
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['id']).to eq thing.id
    end

    it "finds by credit_card_number" do
      thing = transactions(:first)

      get :show, format: :json, credit_card_number: thing.credit_card_number
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['id']).to eq thing.id
    end

    it "finds by result" do
      thing = transactions(:first)

      get :show, format: :json, result: thing.result
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['id']).to eq thing.id
    end


    it "finds by created_at" do
      thing = transactions(:first)

      get :show, format: :json, created_at: thing.created_at
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['id']).to eq thing.id
    end

    it "finds by updated_at" do
      thing = transactions(:first)

      get :show, format: :json, updated_at: thing.updated_at
      transaction = JSON.parse(response.body)

      expect(response).to be_success
      expect(transaction['id']).to eq thing.id
    end
  end

  describe "#index" do
    it "finds all by id" do
      get :index, format: :json, id: 1
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.first['id']).to eq 1
    end

    it "finds all by invoice_id" do
      get :index, format: :json, invoice_id: 1
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.first['id']).to eq 1
    end

    it "finds all by created_at" do
      get :index, format: :json, created_at: "2012-03-27 14:54:10"
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq 2
      expect(transactions.last['id']).to eq 2
    end

    it "finds all by updated_at" do
      get :index, format: :json, updated_at: "2012-03-27 14:54:10"
      transactions = JSON.parse(response.body)

      expect(response).to be_success
      expect(transactions.count).to eq 2

      expect(transactions.last['id']).to eq 2
    end
  end
end
