class Api::V1::Merchants::RevenuesController < Api::ApiController
  respond_to :json

  def index
    respond_with(total_revenue: Merchant.total_revenue_on(params[:date]))
  end

  def show
    if params[:date]
      respond_with(revenue: Merchant.find(params[:id]).revenue_on(params[:date]))
    else
      respond_with(revenue: Merchant.find(params[:id]).total_revenue)
    end
  end
  
end
