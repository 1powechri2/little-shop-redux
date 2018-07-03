RSpec.describe 'Invoice Links Direct to Proper Pages' do
  context 'Invoice Index' do
    it 'clicking on invoice id directs to invoice' do
      merchant = Merchant.create(name: 'Cheese')
      invoice_1 = Invoice.create(merchant_id: 1, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 321, status: 'shipped')
      # require 'pry';binding.pry
      visit '/invoices'

      within('.index-instance:nth-child(1)') do
        click_link(invoice_1.id.to_s)
      end

      expect(current_path).to eq("/invoices/#{invoice_1.id}")
    end
    # it 'clicking on edit directs to edit for specific invoice' do
    #   invoice_1 = Invoice.create(merchant_id: 123, status: 'pending')
    #   invoice_2 = Invoice.create(merchant_id: 321, status: 'shipped')
    #
    #   visit '/invoices'
    #
    #   click_link("/invoices/#{invoice_1.id}/edit")
    #
    #   expect(current_path).to eq("/invoices/#{invoice_1.id}/edit")
    # end
  end
end
