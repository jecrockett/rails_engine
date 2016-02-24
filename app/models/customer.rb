class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    id = self.invoices.successful.group(:merchant_id).count.sort_by { |merchant_id, orders| orders }.last.first
    Merchant.find(id)
  end
end
