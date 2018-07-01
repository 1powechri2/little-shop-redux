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
    joins(:items).select('merchants.*, avg(items.unit_price) AS average_unit_price').group('merchants.id')
  end

  def self.total_item_cost_for_merchant
    joins(:items).select('merchants.*, sum(items.unit_price) AS total_price_of_items').group('merchants.id')
  end

  def self.by_most_items
    merchant = joins(:items).select('merchants.*, count(items.id) AS item_count').group('merchants.id')
    merchant.select(:id).order('item_count DESC')[0]
  end

  def self.by_highest_priced_item
    Merchant.joins(:items).order('unit_price DESC')[0]
    require 'pry';binding.pry
  end
end
