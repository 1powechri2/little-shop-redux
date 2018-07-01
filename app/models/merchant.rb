class Merchant < ActiveRecord::Base
  validates_presence_of :name
  has_many :items
  has_many :invoices

  def self.total_number_of_items(merchant_id)
    merchant = Merchant.find(merchant_id)
    merchant.items.count
  end

  def self.average_item_price_for_merchant
    #WHYWHYWHWYHWYHWYHWYWHWYWY * FROM and GROUP_BY ineffective????
    Merchant.joins(:items).select('merchants.*, avg(items.unit_price) AS average_unit_price, sum(items.unit_price) AS total_cost_of_items').group('merchants.id')
  end
end
