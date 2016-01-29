class CreateRecords < ActiveRecord::Migration
  def change
    create_table :records do |t|
      t.decimal :sum, precision: 17, scale: 2 # Should process really big numbers, like: 100 000 000 000 000.12
      t.string :currency
      t.decimal :undergrounds, precision: 10, scale: 4 # For example: 10000000000 rub is 0.4200 of Omsk Underground
      t.string :reason
      t.float :exchange_rate

      t.timestamps null: false
    end
  end
end
