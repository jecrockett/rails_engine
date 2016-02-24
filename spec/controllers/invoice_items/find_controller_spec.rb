require 'rails_helper'

RSpec.describe Api::V1::InvoiceItems::FindController, type: :controller do
  fixtures :invoice_items
  describe '#show' do
    it "finds by id" do
      invoice_item = invoice_items(:first)

      get :show, format: :json, id: invoice_item.id
      found_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_item['id']).to eq invoice_item.id
    end

    it "finds by item_id" do
      invoice_item = invoice_items(:third)

      get :show, format: :json, item_id: invoice_item.item_id
      found_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_item['invoice_id']).to eq invoice_item.invoice_id
    end

    it "finds by invoice_id" do
      invoice_item = invoice_items(:first)

      get :show, format: :json, invoice_id: invoice_item.invoice_id
      found_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_item['id']).to eq invoice_item.id
    end

    it "finds by quantity" do
      invoice_item = invoice_items(:first)

      get :show, format: :json, quantity: invoice_item.quantity
      found_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_item['id']).to eq invoice_item.id
    end

    it "finds by unit_price" do
      invoice_item = invoice_items(:first)

      get :show, format: :json, unit_price: invoice_item.unit_price
      found_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_item['id']).to eq invoice_item.id
    end

    it "finds by created_at" do
      invoice_item = invoice_items(:first)

      get :show, format: :json, created_at: invoice_item.created_at
      found_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_item['id']).to eq invoice_item.id
    end

    it "finds by updated_at" do
      invoice_item = invoice_items(:first)

      get :show, format: :json, updated_at: invoice_item.updated_at
      found_invoice_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_item['id']).to eq invoice_item.id
    end
  end

  describe "#index" do
    it "finds all by id" do
      get :index, format: :json, id: 1
      found_invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_items.count).to eq 1
      expect(found_invoice_items.first['id']).to eq 1
    end

    it "finds all by item_id" do
      get :index, format: :json, item_id: 1
      found_invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_items.count).to eq 2
      expect(found_invoice_items.first['id']).to eq 1
    end

    it "finds all by invoice_id" do
      get :index, format: :json, invoice_id: 2
      found_invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_items.count).to eq 2
      expect(found_invoice_items.last['id']).to eq 3
    end

    it "finds all by created_at" do
      get :index, format: :json, created_at: "2012-03-27 14:54:09"
      found_invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_items.count).to eq 2
      expect(found_invoice_items.first['id']).to eq 2
    end

    it "finds all by updated_at" do
      get :index, format: :json, updated_at: "2012-03-27 14:54:09"
      found_invoice_items = JSON.parse(response.body)

      expect(response).to be_success
      expect(found_invoice_items.count).to eq 2
      expect(found_invoice_items.first['id']).to eq 2
    end
  end
end
