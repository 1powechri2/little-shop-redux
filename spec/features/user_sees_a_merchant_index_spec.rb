RSpec.describe 'a visitor' do
  context 'visiting /merchants' do
    it 'displays all merchants' do
      Merchant.create(name: 'Old')
      Merchant.create(name: 'MacDonald')
      Merchant.create(name: 'had')
      Merchant.create(name: 'a')
      Merchant.create(name: 'Farm')

      visit '/merchants'

      expect(page).to have_content('Old')
      expect(page).to have_content('MacDonald')
      expect(page).to have_content('had')
      expect(page).to have_content('a')
      expect(page).to have_content('Farm')
    end
    it 'can take them to a merchant page' do
      Merchant.create(name: 'Old')

      visit '/merchants'
      click_link('Old')

      expect(current_path).to eq('/merchants/1')
      expect(page).to have_content('Old')
    end
    it 'can delete a merchant' do
      Merchant.create(name: 'Old')

      visit '/merchants'
      click_on('delete')

      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content('Old')
    end
    it 'can create a new merchant from index page' do
      visit '/merchants'

      click_on("New Merchant")

      expect(current_path).to eq('/merchants/new')
    end
  end
end
