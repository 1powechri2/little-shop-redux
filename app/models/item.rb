class Item < ActiveRecord::Base
  validates_presence_of :name, :description, :unit_price, :image

  has_many :invoice_items

  def get_quantity(item_id)
    InvoiceItem.find_by(item_id: item_id).quantity
  end

  def get_unit_price(item_id)
    InvoiceItem.find_by(item_id: item_id).unit_price
  end
end
