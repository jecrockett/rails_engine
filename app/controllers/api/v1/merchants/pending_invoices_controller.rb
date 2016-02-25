class Api::V1::Merchants::PendingInvoicesController < Api::ApiController
  respond_to :json

  def show
    respond_with Merchant.find(params[:id]).customers_with_pending_invoices
  end

end
