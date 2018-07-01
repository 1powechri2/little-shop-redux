class Item < ActiveRecord::Base
  validates_presence_of :name, :description, :unit_price, :image

  has_many :invoice_items
  has_many :invoices, through: 

  def get_quantity(invoice_id)
    InvoiceItem.where(invoice_id: invoice_id)
  end

  def get_unit_price(item_id)
    InvoiceItem.find_by(item_id: item_id).unit_price
  end
end
