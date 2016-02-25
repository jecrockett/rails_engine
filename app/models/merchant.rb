class Merchant < ActiveRecord::Base
  has_many :invoices
  has_many :items

  def favorite_customer
    id = self.invoices.success.group(:customer_id).count.sort_by { |customer_id, num_of_invoices| num_of_invoices }.last.first
    Customer.find(id)
  end

  def customers_with_pending_invoices
    invoices.pending.distinct.map(&:customer)
  end

  def total_revenue
    invoices.success.joins(:invoice_items).sum("quantity * unit_price")
  end

  def revenue_on(date)
    invoices.success.on(date).joins(:invoice_items).sum("quantity * unit_price")
  end

  def self.total_revenue_on(date)
    Invoice.success.on(date).joins(:invoice_items).sum("quantity * unit_price")
  end
end
