class Invoice < ActiveRecord::Base
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  belongs_to :customer
  belongs_to :merchant

  def self.success
    joins(:transactions).where(transactions: { result: 'success' })
  end

  def self.pending
    joins(:transactions).where(transactions: { result: 'failed' })
  end

  def self.on(date)
    where(created_at: date)
  end
end
