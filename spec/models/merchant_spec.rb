RSpec.describe Merchant do
  describe "Validations" do
    it "is not valid without a name" do
      merchant = Merchant.new

      expect(merchant).to_not be_valid
    end
  end
end 
