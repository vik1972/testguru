class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :surname, null: false
      t.boolean :admin, default: false, null: false
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end