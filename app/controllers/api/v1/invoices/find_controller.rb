class Api::V1::Invoices::FindController < Api::ApiController
  respond_to :json

  def index
    case params.first[0]
    when "id" then respond_with Invoice.where(id: params[:id])
    when "customer_id" then respond_with Invoice.where(customer_id: params[:customer_id])
    when "merchant_id" then respond_with Invoice.where(merchant_id: params[:merchant_id])
    when "status" then respond_with Invoice.where(status: params[:status])
    when "created_at" then respond_with Invoice.where(created_at: params[:created_at])
    when "updated_at" then respond_with Invoice.where(updated_at: params[:updated_at])
    end
  end

  def show
    case params.first[0]
    when "id" then respond_with Invoice.find(params[:id])
    when "customer_id" then respond_with Invoice.find_by(customer_id: params[:customer_id])
    when "merchant_id" then respond_with Invoice.find_by(merchant_id: params[:merchant_id])
    when "status" then respond_with Invoice.find_by(status: params[:status])
    when "created_at" then respond_with Invoice.find_by(created_at: params[:created_at])
    when "updated_at" then respond_with Invoice.find_by(updated_at: params[:updated_at])
    end
  end

end
