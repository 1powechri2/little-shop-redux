require './app/models/merchant.rb'
require './app/models/invoice.rb'
require './app/models/item.rb'
require 'csv'

CSV.foreach('./data/merchants.csv', headers: true, header_converters: :symbol) do |merchant|
  Merchant.create(id: merchant[:id],
                  name: merchant[:name],
                  created_at: merchant[:created_at],
                  updated_at: merchant[:updated_at])
end

CSV.foreach('./data/invoices.csv', headers: true, header_converters: :symbol) do |invoice|
  Invoice.create(id: invoice[:id],
                 merchant_id: invoice[:merchant_id],
                 status: invoice[:status],
                 created_at: invoice[:created_at],
                 updated_at: invoice[:updated_at])
end

CSV.foreach('./data/items.csv', headers: true, header_converters: :symbol) do |item|
  Item.create(id: item[:id],
              name: item[:name],
              description: item[:description],
              unit_price: item[:unit_price],
              image: 'https://a-z-animals.com/media/animals/images/original/capybara3.jpg',
              created_at: item[:created_at],
              updated_at: item[:updated_at])
end
