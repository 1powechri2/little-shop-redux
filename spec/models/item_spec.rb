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
  describe 'CRUD Methods' do
    it 'can create a new item' do
      item = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        price: 5,
                        image: '/images/knob.jpg')

      expect(item.name).to eq('Doorknob')
      expect(item.description).to eq('Made of wax, weighs 50lbs')
      expect(item.price).to eq(5)
      expect(item.image).to eq('/images/knob.jpg')
    end
    it 'can read an item' do
      item_one = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        price: 5,
                        image: '/images/knob.jpg')

      item_two = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            price: 135,
                            image: '/images/elf_boots.jpg')

      first_item = Item.find(1)

      second_item = Item.find(2)

      expect(first_item.name).to eq('Doorknob')
      expect(second_item.name).to eq('Elf Boots')
    end
    it 'can update an item' do
      item = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        price: 5,
                        image: '/images/knob.jpg')

      item.update(price: 10)

      expect(item.price).to eq(10)
    end
    it 'can delete an item' do
      item_one = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        price: 5,
                        image: '/images/knob.jpg')

      item_two = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            price: 135,
                            image: '/images/elf_boots.jpg')

      Item.delete(1)

      Item.delete(2)

      expect(Item.all).to eq([])
    end
  end
end