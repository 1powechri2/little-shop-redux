RSpec.describe 'item edit feature' do
  context 'visitor' do
    it 'clicks on item name to go to update page' do
      item = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')

      visit '/items'

      click_on('EDIT')

      expect(current_path).to eq('/items/1/edit')
    end
    it 'can edit item from edit page' do
      item = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')


      visit '/items/1/edit'

      fill_in("item[name]", with: "Beer Can")
      fill_in("item[description]", with: "Empty")
      fill_in("item[unit_price]", with: 20)
      # fill_in("item[image]", with: "images/rolling_rock.jpeg")

      click_on('submit')

      expect(current_path).to eq('/items/1')

      expect(page).to have_content("Beer Can")
      expect(page).to have_content("Empty")
      expect(page).to have_content(20)
      # expect(page).to have_content("images/rolling_rock.jpeg")
      expect(page).to have_current_path('/items/1')
    end
  end
end
