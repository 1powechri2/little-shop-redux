class Merchant < ActiveRecord::Base
  validates_presence_of :name
  has_many :items
  has_many :invoices

  def self.total_number_of_items(merchant_id)
    merchant = Merchant.find(merchant_id)
  end
end
