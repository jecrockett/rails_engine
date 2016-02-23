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
    Item.create! row.to_h
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
