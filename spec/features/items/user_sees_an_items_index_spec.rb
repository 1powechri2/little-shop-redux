RSpec.describe 'a visitor' do
  context 'visiting /items' do
    it 'has the Items title on the page' do
      visit '/items'

      within('.header') do
        expect(page).to have_content('Items')
      end
    end
    it 'can take them to the Merchants page' do
      visit '/items'

      click_on('Merchants')

      expect(current_path).to eq('/merchants')
    end
    it 'can take them to the dashboard page' do
      item1 = Item.create(name: 'Doorknob',
                          description: 'Made of wax, weighs 50lbs',
                          unit_price: 500,
                          image: '/images/knob.jpg')
      item2 = Item.create(name: 'Wall Hanging',
                          description: 'Hangs on the wall',
                          unit_price: 700,
                          image: '/images/hanging.jpg')

      visit '/items'

      click_on('Dashboard')

      expect(current_path).to eq('/items/dashboard')
    end
    it 'sees an index of items' do
      item1 = Item.create(name: 'Doorknob',
                          description: 'Made of wax, weighs 50lbs',
                          unit_price: 500,
                          image: '/images/knob.jpg')
      item2 = Item.create(name: 'Wall Hanging',
                          description: 'Hangs on the wall',
                          unit_price: 700,
                          image: '/images/hanging.jpg')

      visit '/items'

      expect(page).to have_content('Doorknob')
      expect(page).to have_content('Wall Hanging')
    end
    it 'can take them to an individual item page' do
      item1 = Item.create(name: 'Doorknob',
                          description: 'Made of wax, weighs 50lbs',
                          unit_price: 500,
                          image: '/images/knob.jpg')

      visit '/items'
      click_link('Doorknob')

      expect(current_path).to eq("/items/#{item1.id}")
      expect(page).to have_content('Doorknob')
    end
    xit 'can take them to the edit page' do
      item1 = Item.create(name: 'Doorknob',
                          description: 'Made of wax, weighs 50lbs',
                          unit_price: 500,
                          image: '/images/knob.jpg')

      visit '/items'

      within('.edit') do
        click_on('Edit')
      end

      expect(current_path).to eq("/items/#{item1.id}/edit")
    end
    it 'can delete an item' do
      item1 = Item.create(name: 'Doorknob',
                          description: 'Made of wax, weighs 50lbs',
                          unit_price: 500,
                          image: '/images/knob.jpg')

      visit '/items'
      click_on('Delete')

      expect(current_path).to eq('/items')
      expect(page).to_not have_content('Doorknob')
    end
    xit 'can take them to the create new page' do
      visit '/items'

      within('.create-new') do
        click_button("Create A New Item")
      end

      expect(current_path).to eq('/items/new')
      # expect(page).to have_content('Enter a new Item:')
    end

  end
end
