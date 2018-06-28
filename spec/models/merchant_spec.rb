RSpec.describe Merchant do
  describe "Validations" do
    it "is not valid without a name" do
      merchant = Merchant.new

      expect(merchant).to_not be_valid
    end
    it "is created with id" do
      merchant = Merchant.create(name: 'Pizza Hut')

      expect(merchant.id).to eq(1)
    end
  end
  describe 'CRUD methods' do
    it 'can be created' do
      merchant = Merchant.create(name: 'Big Lots')

      expect(merchant.name).to eq('Big Lots')
      expect(merchant).to eq(Merchant.find(1))
    end
    it 'can update name' do
      merchant = Merchant.create(name: 'Big Lots')

      merchant.update(name: 'Bloodbath and Beyond')

      expect(merchant.name).to eq('Bloodbath and Beyond')
    end
    it 'can be deleted' do
      merchant = Merchant.create(name: 'Big Lots')

      Merchant.delete(1)

      expect(Merchant.all).to eq([])
    end
  end
end
