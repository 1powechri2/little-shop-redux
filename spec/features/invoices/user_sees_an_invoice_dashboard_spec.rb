RSpec.describe 'Invoice Dashboard displays Information' do
  context 'Invoice Dashboard' do
    it 'displays status percentages' do
      invoice_one   = Invoice.create(id: 1, merchant_id: 1, status: 'shipped')
      invoice_two   = Invoice.create(id: 2, merchant_id: 1, status: 'shipped')
      invoice_three = Invoice.create(id: 3, merchant_id: 1, status: 'shipped')
      invoice_four  = Invoice.create(id: 4, merchant_id: 1, status: 'pending')
      invoice_five  = Invoice.create(id: 5, merchant_id: 1, status: 'returned')

      invoice_item_1 = InvoiceItem.create(id: 1, item_id: 47, invoice_id: 2, quantity: 3, unit_price: 5)
      invoice_item_2 = InvoiceItem.create(id: 2, item_id: 48, invoice_id: 1, quantity: 6, unit_price: 20)
      invoice_item_3 = InvoiceItem.create(id: 3, item_id: 49, invoice_id: 2, quantity: 1, unit_price: 400)

      visit '/invoices/dashboard'

      expect(page).to have_content('Shipped: 60.0')
      expect(page).to have_content('Pending: 20.0')
      expect(page).to have_content('Returned: 20.0')
    end
    it 'displays highest and lowest unit prices' do
      invoice_one   = Invoice.create(id: 1, merchant_id: 1, status: 'shipped')
      invoice_two   = Invoice.create(id: 2, merchant_id: 1, status: 'shipped')
      invoice_three = Invoice.create(id: 3, merchant_id: 1, status: 'shipped')
      invoice_four  = Invoice.create(id: 4, merchant_id: 1, status: 'pending')
      invoice_five  = Invoice.create(id: 5, merchant_id: 1, status: 'returned')

      invoice_item_1 = InvoiceItem.create(id: 1, item_id: 47, invoice_id: 1, quantity: 3, unit_price: 5)
      invoice_item_2 = InvoiceItem.create(id: 2, item_id: 48, invoice_id: 3, quantity: 6, unit_price: 20)
      invoice_item_3 = InvoiceItem.create(id: 3, item_id: 49, invoice_id: 2, quantity: 1, unit_price: 400)

      visit '/invoices/dashboard'

      expect(page).to have_content("#{invoice_item_3.id}")
      expect(page).to have_content("#{invoice_item_1.id}")
    end
    it 'displays highest and lowest quantity' do
      invoice_one   = Invoice.create(id: 1, merchant_id: 1, status: 'shipped')
      invoice_two   = Invoice.create(id: 2, merchant_id: 1, status: 'shipped')
      invoice_three = Invoice.create(id: 3, merchant_id: 1, status: 'shipped')
      invoice_four  = Invoice.create(id: 4, merchant_id: 1, status: 'pending')
      invoice_five  = Invoice.create(id: 5, merchant_id: 1, status: 'returned')

      invoice_item_1 = InvoiceItem.create(id: 1, item_id: 47, invoice_id: 1, quantity: 200, unit_price: 5)
      invoice_item_2 = InvoiceItem.create(id: 2, item_id: 48, invoice_id: 3, quantity: 6, unit_price: 20)
      invoice_item_3 = InvoiceItem.create(id: 3, item_id: 49, invoice_id: 2, quantity: 1, unit_price: 400)

      visit '/invoices/dashboard'

      expect(page).to have_content("#{invoice_item_1.id}")
      expect(page).to have_content("#{invoice_item_3.id}")
    end
  end
end
