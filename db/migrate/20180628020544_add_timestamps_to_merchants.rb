class AddTimestampsToMerchants < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :created_at, :datetime, null: false
    add_column :merchants, :updated_at, :datetime, null: false
  end
end
