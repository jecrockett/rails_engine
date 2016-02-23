class Api::V1::MerchantItemsController < Api::ApiController
  respond_to :json

  def index
    respond_with Merchant.joins(:items).where(id: params[:id])
  end

end
