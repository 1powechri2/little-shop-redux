RSpec.describe Invoice do
  context 'display' do
    it 'returns all item names for an invoice' do
      merchant = Merchant.create(name: 'The Feelz')
      invoice = Invoice.create(merchant_id: 1, status: 'pending')
      invoice_item_1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 5, unit_price: 13635)
      invoice_item_2 = InvoiceItem.create(item_id: 2, invoice_id: 1, quantity: 9, unit_price: 23324)
      item_1 = Item.create(name: 'Cheese Whiz', description: 'Cheese that is whizzy', unit_price: 200, merchant_id: 1, image: 'http://whocares.org')
      item_2 = Item.create(name: 'Silly String', description: 'String that is silly', unit_price: 300, merchant_id: 1, image: 'http://www.idont.org')

      visit "/invoices/#{invoice.id}"

      expect(page).to have_content(item_1.name)
      expect(page).to have_content(item_2.name)
    end
    it 'returns all item ids for an invoice' do
      merchant = Merchant.create(name: 'The Feelz')
      invoice = Invoice.create(merchant_id: 1, status: 'pending')
      invoice_item_1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 5, unit_price: 13635)
      invoice_item_2 = InvoiceItem.create(item_id: 2, invoice_id: 1, quantity: 9, unit_price: 23324)
      item_1 = Item.create(name: 'Cheese Whiz', description: 'Cheese that is whizzy', unit_price: 200, merchant_id: 1, image: 'http://whocares.org')
      item_2 = Item.create(name: 'Silly String', description: 'String that is silly', unit_price: 300, merchant_id: 1, image: 'http://www.idont.org')

      expected_result_1 = (item_1.id)
      expected_result_2 = (item_2.id)

      visit "/invoices/#{invoice.id}"

      expect(page).to have_content(expected_result_1)
      expect(page).to have_content(expected_result_2)
    end
    it 'returns all item quantities for an invoice' do
      merchant = Merchant.create(name: 'The Feelz')
      invoice = Invoice.create(merchant_id: 1, status: 'pending')
      invoice_item_1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 5, unit_price: 13635)
      invoice_item_2 = InvoiceItem.create(item_id: 2, invoice_id: 1, quantity: 9, unit_price: 23324)
      item_1 = Item.create(name: 'Cheese Whiz', description: 'Cheese that is whizzy', unit_price: 200, merchant_id: 1, image: 'http://whocares.org')
      item_2 = Item.create(name: 'Silly String', description: 'String that is silly', unit_price: 300, merchant_id: 1, image: 'http://www.idont.org')

      expected_result_1 = (invoice_item_1.quantity)
      expected_result_2 = (invoice_item_2.quantity)

      visit "/invoices/#{invoice.id}"

      expect(page).to have_content(expected_result_1)
      expect(page).to have_content(expected_result_2)
    end
    it 'returns all item unit prices for an invoice' do
      merchant = Merchant.create(name: 'whiz')
      invoice = Invoice.create(merchant_id: 1, status: 'pending')
      invoice_item_1 = InvoiceItem.create(item_id: 1, invoice_id: 1, quantity: 5, unit_price: 13635)
      invoice_item_2 = InvoiceItem.create(item_id: 2, invoice_id: 1, quantity: 9, unit_price: 23324)
      item_1 = Item.create(name: 'Cheese Whiz', description: 'Cheese that is whizzy', unit_price: 13635, merchant_id: 1, image: 'http://whocares.org')
      item_2 = Item.create(name: 'Silly String', description: 'String that is silly', unit_price: 23324, merchant_id: 1, image: 'http://www.idont.org')

      expected_result_1 = (invoice_item_1.unit_price.to_s.insert(-3, "."))
      expected_result_2 = (invoice_item_2.unit_price.to_s.insert(-3, "."))

      visit "/invoices/#{invoice.id}"

      expect(page).to have_content(expected_result_1)
      expect(page).to have_content(expected_result_2)
    end
  end
end
