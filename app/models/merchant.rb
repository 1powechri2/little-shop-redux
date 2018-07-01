class Merchant < ActiveRecord::Base
  validates_presence_of :name
  has_many :items
  has_many :invoices

  def self.total_number_of_items(merchant_id)
    merchant = Merchant.find(merchant_id)
    merchant.items.count
  end

  def self.average_item_price_for_merchant
    Merchant.joins(:items).select(merchants.*)
    require 'pry';binding.pry
  end
end
