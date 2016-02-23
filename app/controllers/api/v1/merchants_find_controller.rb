class Api::V1::MerchantsFindController < Api::ApiController
  respond_to :json

  def index
    case params.first[0]
    when "id" then respond_with Merchant.where(id: params[:id])
    when "name" then respond_with Merchant.where(name: params[:name])
    when "created_at" then respond_with Merchant.where(created_at: params[:created_at])
    when "updated_at" then respond_with Merchant.where(updated_at: params[:updated_at])
    end
  end

  def show
    case params.first[0]
    when "id" then respond_with Merchant.find(params[:id])
    when "name" then respond_with Merchant.find_by(name: params[:name])
    when "created_at" then respond_with Merchant.find_by(created_at: params[:created_at])
    when "updated_at" then respond_with Merchant.find_by(updated_at: params[:updated_at])
    end
  end

end
