class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :card_number
      t.string :card_type
      t.string :expiration
      t.float :annual_percentage_rate
      t.float :balance
      t.integer :card_owner_id
      t.string :card_owner_type

      t.timestamps
    end
  end
end
