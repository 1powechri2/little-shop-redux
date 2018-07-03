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
    it 'can take them to an individual merchant page' do
      Merchant.create(name: 'Old')

      visit '/merchants'
      click_link('Old')

      expect(current_path).to eq('/merchants/1')
      expect(page).to have_content('Old')
    end
    it 'can take them to the edit page' do
      merchant = Merchant.create(name: 'Old')

      visit '/merchants'

      within('.edit') do
        click_on('Edit')
      end

      expect(current_path).to eq("/merchants/#{merchant.id}/edit")
    end
    it 'can delete a merchant' do
      Merchant.create(name: 'Old')

      visit '/merchants'
      click_on('Delete')

      expect(current_path).to eq('/merchants')
      expect(page).to_not have_content('Old')
    end
    it 'can take them to the create new page' do
      visit '/merchants'

      within('.create-new') do
        click_button("Create A New Merchant")
      end

      expect(current_path).to eq('/merchants/new')
      # expect(page).to have_content('Enter a new Merchant:')
    end
    it 'can take them to the items index page' do
      visit '/merchants'

      click_on('Items')

      expect(current_path).to eq('/items')
    end
    it 'can take them to the invoices index page' do
      visit '/merchants'

      click_on('Invoices')

      expect(current_path).to eq('/invoices')
    end
    it 'can take them to the dashboard page' do
      merchant = Merchant.create(name: 'Big Lots')
      item_1 = Item.create(name: 'Doorknob',
                        description: 'Made of wax, weighs 50lbs',
                        unit_price: 5,
                        merchant_id: 1,
                        image: '/images/knob.jpg')
      item_2 = Item.create(name: 'Elf Boots',
                            description: 'Size 9 Mens',
                            unit_price: 135,
                            merchant_id: 1,
                            image: '/images/elf_boots.jpg')

      visit '/merchants'

      click_on('Dashboard')

      expect(current_path).to eq('/merchants/dashboard')
    end
    it "it has 'Little Shop' on the page" do
      visit '/merchants'

      expect(page).to have_content('Little Shop')
    end
    it 'has the Merchants title on the page' do
      visit '/merchants'

      within('.header') do
        expect(page).to have_content('Merchants')
      end
    end
  end
end
