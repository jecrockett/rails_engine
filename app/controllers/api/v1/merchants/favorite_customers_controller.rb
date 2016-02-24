class Api::V1::Merchants::FavoriteCustomersController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.find(params[:id]).favorite_customer
  end

end
