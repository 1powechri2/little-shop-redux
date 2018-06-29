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
end
