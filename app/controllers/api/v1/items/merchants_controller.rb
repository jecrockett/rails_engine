class Api::V1::Items::MerchantsController < Api::ApiController
  respond_to :json

  def show
    respond_with Item.find(params[:id]).merchant
  end

end
