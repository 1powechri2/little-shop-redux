RSpec.describe Invoice do
  context 'calculations for index' do
    it 'returns the total amount for an invoice' do
      invoice = Invoice.create(id: 1, merchant_id: 12335938, status: 'pending')
      invoice_item_1 = InvoiceItem.create(item_id: 263519844, invoice_id: 1, quantity: 5, unit_price: 13635)
      invoice_item_2 = InvoiceItem.create(item_id: 263454779, invoice_id: 1, quantity: 9, unit_price: 23324)

      visit "/invoices/#{invoice.id}"

      expect(page).to have_content('%.2f' % (invoice.get_total_price.to_f/100))
    end
  end
end
