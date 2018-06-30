RSpec.describe 'a visitor' do
  context 'visiting /items' do
    it 'sees an index of items' do
      item = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')

      visit '/items'

      expect(page).to have_content('Doorknob')
      expect(page).to have_current_path('/items')
    end
  end
  context 'visiting /items/id' do
    it 'sees the individual item of a specific id' do
      item = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        image: '/images/knob.jpg')

      visit '/items/1'

      expect(page).to have_content('Doorknob')
    end
  end
  context 'visiting /items/new' do
    it 'creates a new item' do

      visit '/items/new'

      fill_in("item[name]", with: "Beer Can")
      fill_in("item[description]", with: "Empty")
      fill_in("item[unit_price]", with: 20)
      fill_in("item[image]", with: "images/rolling_rock.jpeg")

      click_on("make a new dang dern item")

      expect(page).to have_content("Beer Can")
      expect(page).to have_content("Empty")
      expect(page).to have_content(20)
      expect(page).to have_content("images/rolling_rock.jpeg")
      expect(page).to have_current_path('/items')
    end
  end
end
