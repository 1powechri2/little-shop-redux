RSpec.describe 'Invoice Links Direct to Proper Pages' do
  context 'Invoice Index' do
    it 'clicking on invoice id directs to invoice' do
      invoice_1 = Invoice.create(merchant_id: 123, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 321, status: 'shipped')

      visit '/invoices'

      click_on(invoice_1.id)

      expect(current_path).to eq("/invoices/#{invoice_1.id}")
    end
    it 'clicking on edit directs to edit for specific invoice' do
      invoice_1 = Invoice.create(merchant_id: 123, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 321, status: 'shipped')

      visit '/invoices'

      click_link("/invoices/#{invoice_1.id}/edit")

      expect(current_path).to eq("/invoices/#{invoice_1.id}/edit")
    end
  end
end
