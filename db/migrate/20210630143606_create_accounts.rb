class CreateAccounts < ActiveRecord::Migration[6.1]
  def change
    create_table :accounts do |t|
      t.string :name
      t.float :balance
      t.float :annual_percentage_yield
      t.float :annual_percentage_rate
      t.belongs_to :user

      t.timestamps
    end
  end
end
