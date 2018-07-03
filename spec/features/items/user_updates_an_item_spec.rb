RSpec.describe 'item edit feature' do
  context 'visiting item/#/edit page' do
    it 'can edit item from edit page' do
      merchant = Merchant.create(name: 'Barnacle')
      item = Item.create(name: 'Doorknob',
                         description: 'Made of wax, weighs 50lbs',
                         unit_price: 500,
                         merchant_id: 1,
                         image: '/images/knob.jpg')


      visit "/items/#{item.id}/edit"

      fill_in("item[name]", with: "Beer Can")
      fill_in("item[description]", with: "Empty")
      fill_in("item[unit_price]", with: 20)

      click_on('submit')

      expect(current_path).to eq("/items/#{item.id}")
      expect(page).to have_content("Beer Can")
      expect(page).to have_content(20)
    end
  end
end
