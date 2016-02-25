class Customer < ActiveRecord::Base
  has_many :invoices
  has_many :transactions, through: :invoices

  def favorite_merchant
    self.invoices.success.joins(:merchant).group(:merchant).order(count: :desc).count.first.first
  end
end
