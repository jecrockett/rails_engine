class Api::V1::Customers::FindController < Api::ApiController
  respond_to :json

  def index
    case params.first[0]
    when "id" then respond_with Customer.where(id: params[:id])
    when "first_name" then respond_with Customer.where(first_name: params[:first_name])
    when "last_name" then respond_with Customer.where(last_name: params[:last_name])
    when "created_at" then respond_with Customer.where(created_at: params[:created_at])
    when "updated_at" then respond_with Customer.where(updated_at: params[:updated_at])
    end
  end

  def show
    case params.first[0]
    when "id" then respond_with Customer.find(params[:id])
    when "first_name" then respond_with Customer.find_by(first_name: params[:first_name])
    when "last_name" then respond_with Customer.find_by(last_name: params[:last_name])
    when "created_at" then respond_with Customer.find_by(created_at: params[:created_at])
    when "updated_at" then respond_with Customer.find_by(updated_at: params[:updated_at])
    end
  end

end
