class CreateAccounts < ActiveRecord::Migration[5.0]
  def change
    create_table :accounts do |t|
      t.integer :amount
      t.date :period
      t.string :info
      t.integer :catagory_id

      t.timestamps
    end
    add_index :accounts, :catagory_id
  end
end
