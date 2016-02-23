class Api::V1::MerchantsFindController < Api::ApiController
  respond_to :json

  def index
    case params.first[0]
    when "id" then respond_with Merchant.where(id: params[:id])
    when "name" then respond_with Merchant.where(name: params[:name])
    end
  end

  def show
    case params.first[0]
    when "id" then respond_with Merchant.find(params[:id])
    when "name" then respond_with Merchant.find_by(name: params[:name])
    end
  end

end
