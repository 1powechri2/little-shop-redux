class Invoice < ActiveRecord::Base
  validates_presence_of :merchant_id, :status

  has_many :invoice_items
  has_many :items, through: :invoice_items

  def self.get_quantity(invoice_id)
    InvoiceItem.where(invoice_id: invoice_id)
  end

  def get_total_price(invoice_id)
    ii = InvoiceItem.where(invoice_id: invoice_id)
    ii.sum("invoice_items.unit_price * invoice_items.quantity")
  end
end
