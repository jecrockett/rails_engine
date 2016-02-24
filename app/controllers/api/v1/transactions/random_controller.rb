class Api::V1::Transactions::RandomController < Api::ApiController
  respond_to :json

  def show
    respond_with Transaction.limit(1).order("RANDOM()")
  end

end
