class Api::V1::Customers::InvoicesController < Api::ApiController
  respond_to :json

  def index
    respond_with Invoice.where(customer_id: params[:id])
  end

end
