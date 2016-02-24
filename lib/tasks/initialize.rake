require 'csv'


desc "TODO"
task seed_data: [:environment] do
  customers = "vendor/assets/data/customers.csv"
  invoices = "vendor/assets/data/invoices.csv"
  items = "vendor/assets/data/items.csv"
  merchants = "vendor/assets/data/merchants.csv"
  transactions = "vendor/assets/data/transactions.csv"
  invoice_items = "vendor/assets/data/invoice_items.csv"

  CSV.foreach(customers, :headers => true) do |row|
    Customer.create! row.to_h
  end

  CSV.foreach(merchants, :headers => true) do |row|
    Merchant.create! row.to_h
  end

  CSV.foreach(items, :headers => true) do |row|
    t = Item.create
    t.name = row['name']
    t.description = row['description']
    t.unit_price = (row['unit_price'].to_f/100).to_s
    t.merchant_id = row['merchant_id']
    t.updated_at = row['updated_at']
    t.created_at = row['created_at']
    t.save
  end

  CSV.foreach(invoices, :headers => true) do |row|
    Invoice.create! row.to_h
  end

  CSV.foreach(transactions, :headers => true) do |row|
    Transaction.create! row.to_h
  end

  CSV.foreach(invoice_items, :headers => true) do |row|
    InvoiceItem.create! row.to_h
  end

end
