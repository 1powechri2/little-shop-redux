RSpec.describe 'a visitor' do
  context 'visiting /items/id' do
    it 'sees the individual item of a specific id' do
      item = Item.create(name: 'Doorknob',
                         description: 'Made of wax, weighs 50lbs',
                         unit_price: 500,
                         image: '/images/knob.jpg')

      visit "/items/#{item.id}"

      expect(page).to have_content('Doorknob')
    end
  end
end
