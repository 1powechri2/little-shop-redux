class LittleShopApp < Sinatra::Base
  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/show/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end
end
