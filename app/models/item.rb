class Item < ActiveRecord::Base
  validates_presence_of :name, :description, :unit_price, :image

  has_many :invoice_items
end
