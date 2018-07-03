RSpec.describe 'a visitor' do
  context 'visiting /invoices' do
    it 'sees an index of invoices' do
      invoice_1 = Invoice.create(merchant_id: 123, status: 'pending')
      invoice_2 = Invoice.create(merchant_id: 321, status: 'shipped')

      visit '/invoices'

      expect(page).to have_content(invoice_1.id)
      expect(page).to have_content(invoice_2.id)
    end
    xit 'can take them to an invoice page' do
      invoice_1 = Invoice.create(merchant_id: 123, status: 'pending')

      visit '/invoices'
      within('index-instance') do
        click_link( "#{invoice_1.id}")
      end

      expect(current_path).to eq('/invoices/<%= invoice_1.id %>')
      expect(page).to have_content(invoice_1.id)
    end
    it 'can delete an invoice' do
      invoice_1 = Invoice.create(merchant_id: 123, status: 'pending')

      visit '/invoices'

      click_on('Delete')

      expect(current_path).to eq('/invoices')
      expect(page).to_not have_content(invoice_1.id)
    end
  end
  context 'visiting /invoices/id' do
    it 'sees the individual invoice of a specific id' do
      merchant = Merchant.create(name: 'Parcheesi')
      invoice_1 = Invoice.create(merchant_id: 1, status: 'pending')

      visit '/invoices/1'

      expect(page).to have_content(invoice_1.id)
    end
  end
  context 'visiting /invoices/:id/edit' do
    it 'sees the edit form for an invoice' do
      merchant = Merchant.create(name: 'Parcheesi')
      invoice_1 = Invoice.create(merchant_id: 1, status: 'pending')

      visit "/invoices/#{invoice_1.id}/edit"

      expect(page).to have_content("#{invoice_1.id}")
      expect(page).to have_content("#{invoice_1.status}".capitalize)
      expect(page).to have_content("#{invoice_1.invoice_items.first}")
    end
  end
end
