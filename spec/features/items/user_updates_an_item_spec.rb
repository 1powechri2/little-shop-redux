RSpec.describe 'item edit feature' do
  context 'visiting item/#/edit page' do
    it 'can edit item from edit page' do
      item = Item.create(name: 'Doorknob',
                         description: 'Made of wax, weighs 50lbs',
                         unit_price: 500,
                         image: '/images/knob.jpg')


      visit "/items/#{item.id}/edit"

      fill_in("item[name]", with: "Beer Can")
      fill_in("item[description]", with: "Empty")
      fill_in("item[unit_price]", with: 20)
      # fill_in("item[image]", with: "images/rolling_rock.jpeg")

      click_on('submit')

      expect(current_path).to eq("/items/#{item.id}")

      expect(page).to have_content("Beer Can")
      expect(page).to have_content("Empty")
      expect(page).to have_content(20)
      # expect(page).to have_content("images/rolling_rock.jpeg")
    end
  end
end
