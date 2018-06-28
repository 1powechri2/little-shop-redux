RSpec.describe Item do
  describe 'Validations' do
    it 'it is not valid without a name' do
      item = Item.new

      expect(item).to_not be_valid
    end
    it 'it is not valid without a description' do
      item = Item.new(name: 'Chris')

      expect(item).to_not be_valid
    end
    it 'it is not valid without a price' do
      item = Item.new(name: 'Chris',
                     description: 'Half Alien')

      expect(item).to_not be_valid
    end
    it 'it is not valid without an image' do
      item = Item.new(name: 'Chris',
                     description: 'Half Alien',
                     price: 40000000000000000)

      expect(item).to_not be_valid
    end
  end
end
