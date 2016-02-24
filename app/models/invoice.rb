class Invoice < ActiveRecord::Base
  has_many :invoice_items
  has_many :items, through: :invoice_items
  has_many :transactions
  belongs_to :customer
  belongs_to :merchant

  def self.successful
    joins(:transactions).where("result = 'success'")
  end

  def self.pending
    joins(:transactions).where("result = 'failed'")
  end
end
