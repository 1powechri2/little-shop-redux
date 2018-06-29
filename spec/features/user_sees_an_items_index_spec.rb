RSpec.describe 'a visitor' do
  context 'visiting /items' do
    it 'sees an index of items' do
      item = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        price: 5,
                        image: '/images/knob.jpg')

      visit '/items'

      expect(page).to have_content('Doorknob')
    end
  end
  context 'visiting /items/id' do
    it 'sees the individual item of a specific id' do
      item = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        price: 5,
                        image: '/images/knob.jpg')

      visit '/items/1'

      expect(page).to have_content('Doorknob')
    end
  end
end
