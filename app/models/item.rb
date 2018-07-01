class Item < ActiveRecord::Base
  validates_presence_of :name, :description, :unit_price, :image

  has_many :invoice_items
  belongs_to :merchant

  def self.total_items
    Item.all.count
  end

  def self.average_unit_price
    average(:unit_price)
  end

  def self.most_recent_item
    order(:created_at).last
  end

  def self.least_recent_item
    order(:created_at).first
  end
end
