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
end
