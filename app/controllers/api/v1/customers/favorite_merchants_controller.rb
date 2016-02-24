class Api::V1::Customers::FavoriteMerchantsController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.find(params[:id]).favorite_merchant
  end

end
