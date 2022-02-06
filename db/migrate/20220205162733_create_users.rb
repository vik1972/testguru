class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.boolean :admin, default: false, null: false
      t.string :email

      t.timestamps
    end
  end
end
