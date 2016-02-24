class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  def favorite_customer
    id = self.invoices.successful.group(:customer_id).count.sort_by { |customer_id, num_of_invoices| num_of_invoices }.last.first
    Customer.find(id)
  end
end
