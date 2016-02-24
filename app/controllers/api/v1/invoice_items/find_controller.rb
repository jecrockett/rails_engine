class Api::V1::InvoiceItems::FindController < Api::ApiController
  respond_to :json

  def index
    case params.first[0]
    when "id" then respond_with InvoiceItem.where(id: params[:id])
    when "item_id" then respond_with InvoiceItem.where(item_id: params[:item_id])
    when "invoice_id" then respond_with InvoiceItem.where(invoice_id: params[:invoice_id])
    when "quantity" then respond_with InvoiceItem.where(quantity: params[:quantity])
    when "unit_price" then respond_with InvoiceItem.where(unit_price: params[:unit_price])
    when "created_at" then respond_with InvoiceItem.where(created_at: params[:created_at])
    when "updated_at" then respond_with InvoiceItem.where(updated_at: params[:updated_at])
    end
  end

  def show
    case params.first[0]
    when "id" then respond_with InvoiceItem.find(params[:id])
    when "item_id" then respond_with InvoiceItem.find_by(item_id: params[:item_id])
    when "invoice_id" then respond_with InvoiceItem.find_by(invoice_id: params[:invoice_id])
    when "quantity" then respond_with InvoiceItem.find_by(quantity: params[:quantity])
    when "unit_price" then respond_with InvoiceItem.find_by(unit_price: params[:unit_price])
    when "created_at" then respond_with InvoiceItem.find_by(created_at: params[:created_at])
    when "updated_at" then respond_with InvoiceItem.find_by(updated_at: params[:updated_at])
    end
  end

end

# def index
# respond with InvoiceItem.where(nvoice_item_params)
# end

# def invoice_item_params
# params.permit(:keys)
#end
