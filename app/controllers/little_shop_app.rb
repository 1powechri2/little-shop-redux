class LittleShopApp < Sinatra::Base
  get '/merchants' do
    @merchants = Merchant.all
    erb :'merchants/index'
  end

  get '/merchants/new' do
    erb :'merchants/new'
  end

  get '/merchants/dashboard' do
    @merchant_most_items = Merchant.by_most_items
    @merchant_with_priciest_item = Merchant.by_highest_priced_item
    @merchants = Merchant.all
    @merch_stats = Merchant.merchant_statistics
    erb :'merchants/dashboard'
  end

  post '/merchants' do
    Merchant.create(params[:merchant])
    redirect '/merchants'
  end

  get '/merchants/:id' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/show'
  end

  get '/merchants/:id/edit' do
    @merchant = Merchant.find(params[:id])
    erb :'merchants/edit'
  end

  put '/merchants/:id' do |id|
    Merchant.update(id.to_i, params[:merchant])
    redirect "/merchants/#{id}"
  end

  delete '/merchants/:id' do |id|
    Merchant.destroy(id.to_i)
    redirect '/merchants'
  end

  get '/invoices' do
    @invoices = Invoice.all
    erb :'invoices/index'
  end

  get '/invoices/dashboard' do
    @percent_shipped  = Invoice.percent_status('shipped')
    @percent_pending  = Invoice.percent_status('pending')
    @percent_returned = Invoice.percent_status('returned')
    @highest_priced   = Invoice.highest_unit_price
    @lowest_priced    = Invoice.lowest_unit_price
    @highest_quantity = Invoice.highest_quantity
    @lowest_quantity  = Invoice.lowest_quantity
    erb :'invoices/dashboard'
  end

  get '/invoices/:id' do
    @invoice = Invoice.find(params[:id])
    @merchant = @invoice.merchant
    @invoice_items = InvoiceItem.where(invoice_id: @invoice.id)
    erb :'invoices/show'
  end

  get '/invoices/:id/edit' do
    @invoice = Invoice.find(params[:id])
    erb :'invoices/edit'
  end

  put '/invoices/:id' do |id|
    Invoice.update(id.to_i, params[:invoice])
    redirect "/invoices/#{id}"
  end

  delete '/invoices/:id' do |id|
    Invoice.destroy(id.to_i)
    redirect '/invoices'
  end

  get '/items' do
    @items = Item.all
    erb :'items/index'
  end

  get '/items/new' do
    @merchants = Merchant.all
    erb :'items/new'
  end

  get '/items/dashboard' do
    @items_count = Item.total_items
    @item_price_average = Item.average_unit_price
    @most_recent_item = Item.most_recent_item
    @least_recent_item = Item.least_recent_item
    erb :'items/dashboard'
  end

  get '/items/:id' do
    @item = Item.find(params[:id])
    @merchant = @item.merchant
    erb :'items/show'
  end

  post '/items' do
    Item.create(params[:item])
    redirect '/items'
  end

  get '/items/:id/edit' do
    @item = Item.find(params[:id])
    erb :'items/edit'
  end

  put '/items/:id' do |id|
    Item.update(id.to_i, params[:item])
    redirect "/items/#{id}"
  end

  delete '/items/:id' do |id|
    Item.destroy(id.to_i)
    redirect "/items"
  end
end
