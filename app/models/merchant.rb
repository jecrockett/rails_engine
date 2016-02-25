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
    invoices.successful.joins(:invoice_items).sum("quantity * unit_price")
  end

  def revenue_by_date(date)
    invoices.successful.by_date(date).joins(:invoice_items).sum("quantity * unit_price")
  end

  def self.total_revenue_by_date(date)
    Invoice.successful.by_date(date).joins(:invoice_items).sum("quantity * unit_price")
  end
end
