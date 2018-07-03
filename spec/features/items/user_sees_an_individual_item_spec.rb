RSpec.describe 'a visitor' do
  context 'visiting /items/id' do
    it 'sees the individual item of a specific id' do
      merchant = Merchant.create(name: 'Alistair')
      item = Item.create(name: 'Doorknob',
                         description: 'Made of wax, weighs 50lbs',
                         unit_price: 500,
                         merchant_id: 1,
                         image: '/images/knob.jpg')

      visit "/items/#{"1"}"

      expect(page).to have_content(item.name)
    end
  end
end
