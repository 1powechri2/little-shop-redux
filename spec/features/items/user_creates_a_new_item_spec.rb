RSpec.describe 'a visitor' do
  context 'visiting /items/new' do
    it 'creates a new item' do

      visit '/items/new'

      fill_in("item[name]", with: "Beer Can")
      fill_in("item[description]", with: "Empty")
      fill_in("item[unit_price]", with: 20)
      fill_in("item[image]", with: "images/rolling_rock.jpeg")

      click_on("make a new dang dern item")

      expect(page).to have_content("Beer Can")
      expect(page).to have_content(20)
      expect(page).to have_current_path('/items')
    end
  end
end
