require 'rails_helper'

RSpec.describe Api::V1::Invoices::FindController, type: :controller do
  fixtures :invoices
  describe '#show' do
    it "finds by id" do
      invoice = invoices(:first)

      get :show, format: :json, id: invoice.id
      found_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice['id']).to eq invoice.id
    end

    it "finds by customer_id" do
      invoice = invoices(:first)

      get :show, format: :json, customer_id: invoice.customer_id
      found_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice['id']).to eq invoice.id
    end

    it "finds by merchant_id" do
      invoice = invoices(:third)

      get :show, format: :json, merchant_id: invoice.merchant_id
      found_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice['id']).to eq invoice.id
    end

    it "finds by status" do
      invoice = invoices(:first)

      get :show, format: :json, status: invoice.status
      found_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice['id']).to eq invoice.id
    end

    it "finds by created_at" do
      invoice = invoices(:first)

      get :show, format: :json, created_at: invoice.created_at
      found_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice['id']).to eq invoice.id
    end

    it "finds by updated_at" do
      invoice = invoices(:first)

      get :show, format: :json, updated_at: invoice.updated_at
      found_invoice = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice['id']).to eq invoice.id
    end
  end

  describe "#index" do
    it "finds all by id" do
      get :index, format: :json, id: 1
      found_invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoices.count).to eq 1
      expect(found_invoices.first['id']).to eq 1
    end

    it "finds all by customer_id" do
      get :index, format: :json, customer_id: 2
      found_invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoices.count).to eq 2
      expect(found_invoices.last['id']).to eq 3
    end

    it "finds all by created_at" do
      get :index, format: :json, created_at: "2012-03-25 13:54:12"
      found_invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoices.count).to eq 2
      expect(found_invoices.first['id']).to eq 1
    end

    it "finds all by updated_at" do
      get :index, format: :json, updated_at: "2012-03-25 13:54:12"
      found_invoices = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoices.count).to eq 2
      expect(found_invoices.first['id']).to eq 1
    end
  end
end
