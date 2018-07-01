RSpec.describe Item do
  context 'item calculations' do
    it 'displays the total amount of items' do
      item_1 = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 135,
                            image: '/images/elf_boots.jpg')

      visit '/items/dashboard'

      expect(page).to have_content(Item.all.count)
  end
    it 'displays the average unit price of all items' do
      item_1 = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 10,
                            image: '/images/elf_boots.jpg')

      visit '/items/dashboard'
      added = Item.all.reduce([]) do |sum, item|
        sum << item.unit_price.to_f
      end
      average = (added.sum / Item.all.count)

      expect(page).to have_content(average)
  end
    it 'displays most recently created item' do
      item_1 = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 135,
                            image: '/images/elf_boots.jpg')

      expected_result = Item.most_recent_item
      visit '/items/dashboard'

      expect(expected_result).to eq(item_2)
  end
    it 'displays the least recently created item' do
      item_1 = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 135,
                            image: '/images/elf_boots.jpg')

      expected_result = Item.most_recent_item
      visit '/items/dashboard'

      expect(expected_result).to eq(item_2)
    end 
  end
end
