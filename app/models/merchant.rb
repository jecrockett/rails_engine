class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  def favorite_customer
    id = self.invoices.successful.group(:customer_id).count.sort_by { |customer_id, num_of_invoices| num_of_invoices }.last.first
    Customer.find(id)
  end

  def pending_invoices
    invoices.pending.distinct.map(&:customer)
  end

  def total_revenue
    invoices.joins(:invoice_items).sum("quantity * unit_price.to_i")
  end
end
