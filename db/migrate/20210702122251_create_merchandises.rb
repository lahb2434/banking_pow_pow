class CreateMerchandises < ActiveRecord::Migration[6.1]
  def change
    create_table :merchandises do |t|
      t.string :name
      t.float :price 
      t.integer :owner_id
      t.string :owner_type
      t.belongs_to :user  
      t.belongs_to :account

      t.timestamps
    end
  end
end
