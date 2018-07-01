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
  context 'Calculations for Merchant Dashboard' do
    it 'returns total number of items for merchant' do
      merchant = Merchant.create(name: 'Big Lots')
      item_1 = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        merchant_id: 1,
                        image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 135,
                            merchant_id: 1,
                            image: '/images/elf_boots.jpg')
      expected_result = Merchant.total_number_of_items(merchant.id)

      expect(expected_result).to eq(Item.all.count)
    end
    it 'returns the average unit price for a merchant' do
      merchant = Merchant.create(name: 'Big Lots')
      item_1 = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        merchant_id: 1,
                        image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 10,
                            merchant_id: 1,
                            image: '/images/elf_boots.jpg')
      expected_result = Merchant.average_and_total_item_price_for_merchant

      expect(expected_result[0].average_unit_price).to eq(7.5)
    end
    # it 'returns the average item price for a merchant' do
    #
    # end
  end
end
