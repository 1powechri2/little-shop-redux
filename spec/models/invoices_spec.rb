RSpec.describe Invoice do
  describe 'Validations' do
    it 'is not valid without a merchant id' do
      invoice = Invoice.new(status: 'pending')

      expect(invoice).to_not be_valid
    end
    it 'is not valid without a status' do
      invoice = Invoice.new(merchant_id: 5)

      expect(invoice).to_not be_valid
    end
  end
  describe 'CRUD Methods' do
    it 'can read an invoice' do
      invoice_1 = Invoice.create(merchant_id: 123, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 321, status: 'shipped')

      first_invoice = Invoice.find(1)

      second_invoice = Invoice.find(2)

      expect(first_invoice.merchant_id).to eq(123)
      expect(second_invoice.merchant_id).to eq(321)
    end
    it 'can update an invoice' do
      invoice_1 = Invoice.create(merchant_id: 123, status: 'pending')

      invoice_1.update(status: 'shipped')

      expect(invoice_1.status).to eq('shipped')
    end
    it 'can delete an invoice' do
      invoice_1 = Invoice.create(merchant_id: 123, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 321, status: 'shipped')

      Invoice.delete(1)

      Invoice.delete(2)

      expect(Invoice.all).to eq([])
    end
  end
  describe 'calculations for invoice data' do
    it 'returns total price of an item' do
      invoice = Invoice.create(id: 1, merchant_id: 12335938, status: 'pending')
      invoice_item_1 = InvoiceItem.create(item_id: 263519844, invoice_id: 1, quantity: 5, unit_price: 13635)
      invoice_item_2 = InvoiceItem.create(item_id: 263454779, invoice_id: 1, quantity: 9, unit_price: 23324)

      total = invoice.get_total_price(invoice.id)

      expect(total).to eq(278091)
    end
  end
  describe 'invoice calculations' do
    it 'returns the average status for all invoices' do
      invoice_one   = Invoice.create(id: 1, merchant_id: 1, status: 'shipped')
      invoice_two   = Invoice.create(id: 2, merchant_id: 1, status: 'shipped')
      invoice_three = Invoice.create(id: 3, merchant_id: 1, status: 'shipped')
      invoice_four  = Invoice.create(id: 4, merchant_id: 1, status: 'pending')
      invoice_five  = Invoice.create(id: 5, merchant_id: 1, status: 'pending')

      percent_ship = Invoice.percent_shipped
      percent_pend = Invoice.percent_pending

      expect(percent_ship).to equal(60.0)
      expect(percent_pend).to equal(40.0)
    end
    it 'finds invoice with highest associated unit price' do
      invoice_one   = Invoice.create(id: 1, merchant_id: 1, status: 'shipped')
      invoice_two   = Invoice.create(id: 2, merchant_id: 1, status: 'shipped')

      invoice_item_1 = InvoiceItem.create(id: 1, item_id: 47, invoice_id: 2, quantity: 3, unit_price: 5)
      invoice_item_2 = InvoiceItem.create(id: 2, item_id: 48, invoice_id: 1, quantity: 6, unit_price: 20)
      invoice_item_3 = InvoiceItem.create(id: 3, item_id: 49, invoice_id: 2, quantity: 1, unit_price: 400)

      expected = invoice_two
      actual   = Invoice.highest_unit_price

      expect(actual).to eq(expected)
    end
    it 'finds invoice with lowest associated unit price' do
      invoice_one   = Invoice.create(id: 1, merchant_id: 1, status: 'shipped')
      invoice_two   = Invoice.create(id: 2, merchant_id: 1, status: 'shipped')

      invoice_item_1 = InvoiceItem.create(id: 1, item_id: 47, invoice_id: 2, quantity: 3, unit_price: 20)
      invoice_item_2 = InvoiceItem.create(id: 2, item_id: 48, invoice_id: 1, quantity: 6, unit_price: 5)
      invoice_item_3 = InvoiceItem.create(id: 3, item_id: 49, invoice_id: 2, quantity: 1, unit_price: 400)

      expected = invoice_one
      actual   = Invoice.lowest_unit_price

      expect(actual).to eq(expected)
    end
  end
end
