class AddReadyToTest < ActiveRecord::Migration[6.1]
  #Add new column
  def change
    add_column :tests, :ready, :boolean, default: false, null: false
  end
end
