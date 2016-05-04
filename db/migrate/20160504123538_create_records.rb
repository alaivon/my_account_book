class CreateRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :records do |t|
      t.integer :amount
      t.date :period
      t.string :info
      t.integer :catagory_id

      t.timestamps
    end
    add_index :records, :catagory_id
  end
end
