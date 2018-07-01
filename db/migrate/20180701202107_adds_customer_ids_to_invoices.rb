class AddsCustomerIdsToInvoices < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :customer_id, :integer
  end
end
