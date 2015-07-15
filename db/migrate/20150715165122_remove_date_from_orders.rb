class RemoveDateFromOrders < ActiveRecord::Migration
  def change
    remove_column :orders, :date, :datetime
  end
end
