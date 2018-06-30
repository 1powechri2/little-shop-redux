RSpec.describe 'a visitor' do
  context 'visiting /invoices' do
    it 'sees an index of invoices' do
      invoice_1 = Invoice.create(merchant_id: 123, status: 'pending')

      visit '/invoices'

      expect(page).to have_content(invoice_1.id)
    end
  end
  context 'visiting /invoices/id' do
    it 'sees the individual invoice of a specific id' do
      invoice_1 = Invoice.create(merchant_id: 123, status: 'pending')

      visit '/invoices/1'

      expect(page).to have_content(invoice_1.id)
    end
  end
end
