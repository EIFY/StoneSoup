class CreateStockHoldings < ActiveRecord::Migration
  def change
    create_table :stock_holdings do |t|
      t.references :user
      t.references :stock
      
      t.decimal :shares

      t.timestamps
    end
  end
end
