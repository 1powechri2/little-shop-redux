class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text     :name
      t.text     :description
      t.integer  :unit_price
      t.text     :image

      t.timestamps null: false
    end
  end
end
