class AddUsersColumnNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :surname, false)
  end
end
