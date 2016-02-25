class Api::V1::Customers::RandomController < Api::ApiController
  respond_to :json

  def show
    respond_with Customer.limit(1).order("RANDOM()")
  end
  
end
