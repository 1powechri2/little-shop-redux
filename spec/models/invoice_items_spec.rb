RSpec.describe InvoiceItem do
  describe 'Validations' do
    it 'is invalid without an item id' do
      invoice_item = InvoiceItem.new(invoice_id: 47, quantity: 40, unit_price: 400)

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without an invoice id' do
      invoice_item = InvoiceItem.new(item_id: 47, quantity: 40, unit_price: 400)

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without a quantity' do
      invoice_item = InvoiceItem.new(item_id: 4, invoice_id: 47, unit_price: 400)

      expect(invoice_item).to_not be_valid
    end
    it 'is invalid without a unit price' do
      invoice_item = InvoiceItem.new(item_id: 4, invoice_id: 47, quantity: 40)

      expect(invoice_item).to_not be_valid
    end
  end
end
