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
    it 'it is not valid without a unit_price' do
      item = Item.new(name: 'Chris',
                     description: 'Half Alien')

      expect(item).to_not be_valid
    end
    it 'it is not valid without an image' do
      item = Item.new(name: 'Chris',
                     description: 'Half Alien',
                     unit_price: 40000000000000000)

      expect(item).to_not be_valid
    end
  end
  describe 'CRUD Methods' do
    it 'can create a new item' do
      item = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')

      expect(item.name).to eq('Doorknob')
      expect(item.description).to eq('Made of wax, weighs 50lbs')
      expect(item.unit_price).to eq(5)
      expect(item.image).to eq('/images/knob.jpg')
    end
    it 'can read an item' do
      item_one = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')

      item_two = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 135,
                            image: '/images/elf_boots.jpg')

      first_item = Item.find(1)

      second_item = Item.find(2)

      expect(first_item.name).to eq('Doorknob')
      expect(second_item.name).to eq('Elf Boots')
    end
    it 'can update an item' do
      item = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')

      item.update(unit_price: 10)

      expect(item.unit_price).to eq(10)
    end
    it 'can delete an item' do
      item_one = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')

      item_two = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 135,
                            image: '/images/elf_boots.jpg')

      Item.delete(1)

      Item.delete(2)

      expect(Item.all).to eq([])
    end
  end
  context 'aggregate items information' do
    it 'counts the total amount of items' do
      item_1 = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')

      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 135,
                            image: '/images/elf_boots.jpg')
      all_items = Item.all.reduce([]){|sum, item| sum << item}
      expected_result = (Item.all.count)

      expect(all_items.count).to eq(expected_result)
    end
    it 'can find the average price per item' do
      item_1 = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')

      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 10,
                            image: '/images/elf_boots.jpg')
      expected_result = Item.average_unit_price

      added = Item.all.reduce([]) do |sum, item|
        sum << item.unit_price.to_f
      end
      average = (added.sum / Item.all.count)

      expect(expected_result).to eq(average)
    end
    it 'displays the most recently created item' do
      item_1 = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 135,
                            image: '/images/elf_boots.jpg')

      expected_result = Item.most_recent_item

      expect(expected_result).to eq(item_2)
    end
    it 'displays the oldest created item' do
      item_1 = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 135,
                            image: '/images/elf_boots.jpg')

      expected_result = Item.least_recent_item

      expect(expected_result).to eq(item_1)
    end
  end
end
