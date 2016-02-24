class Api::V1::Transactions::FindController < Api::ApiController
  respond_to :json

  def index
    case params.first[0]
    when "id" then respond_with Transaction.where(id: params[:id])
    when "invoice_id" then respond_with Transaction.where(invoice_id: params[:invoice_id])
    when "credit_card_number" then respond_with Transaction.where(credit_card_number: params[:credit_card_number])
    when "result" then respond_with Transaction.where(result: params[:result])
    when "created_at" then respond_with Transaction.where(created_at: params[:created_at])
    when "updated_at" then respond_with Transaction.where(updated_at: params[:updated_at])
    end
  end

  def show
    case params.first[0]
    when "id" then respond_with Transaction.find(params[:id])
    when "invoice_id" then respond_with Transaction.find_by(invoice_id: params[:invoice_id])
    when "credit_card_number" then respond_with Transaction.find_by(credit_card_number: params[:credit_card_number])
    when "result" then respond_with Transaction.find_by(result: params[:result])
    when "created_at" then respond_with Transaction.find_by(created_at: params[:created_at])
    when "updated_at" then respond_with Transaction.find_by(updated_at: params[:updated_at])
    end
  end

end
