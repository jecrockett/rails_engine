require 'rails_helper'

RSpec.describe Api::V1::Items::RandomController, type: :controller do
  fixtures :items
  describe "#show" do
    it "returns a random item" do
      get :show, format: :json
      random_item = JSON.parse(response.body)

      expect(response).to be_success
      expect(random_item.count).to eq 1
    end
  end
end
