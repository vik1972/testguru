class AddTypeAttributesToUsers < ActiveRecord::Migration[6.1]
  def up
    add_column :users, :type, :string, null: false, default: 'User'
    remove_column :users, :admin
    add_index :users, :type
    change_column_null :users, :name, true
    change_column_null :users, :surname, true
  end

  def down
    add_column :users, :admin, :boolean
    change_column_default :users, :admin, false
    remove_column :users, :type
    change_column_null :users, :name, false
    change_column_null :users, :surname, false
  end
end
