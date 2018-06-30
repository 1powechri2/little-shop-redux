RSpec.describe 'item update feature' do
  context 'visitor' do
    it 'clicks on item name to go to update page' do
      item = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')

      visit '/items'
      click_on('EDIT')
      within("#edit-button") do
        expect(page).to have_current_path('/items/1/edit')
        expect(current_path).to eq('/items/1/edit')
      end
    end
  end
end
