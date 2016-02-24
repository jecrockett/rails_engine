class Api::V1::Merchants::RevenueTotalsController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.find(params[:id]).total_revenue
  end

end
