class CreateStockTransactions < ActiveRecord::Migration
  def change
    create_table :stock_transactions do |t|
      
      t.references :user
      t.references :stock
      
      t.string :type
      t.decimal :shares
      t.decimal :value

      t.timestamps
    end
  end
end
