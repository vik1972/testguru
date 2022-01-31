class AddUniqueIndexToTest < ActiveRecord::Migration[7.0]
  def change
    #add_index(:accounts, [:branch_id, :party_id], unique: true)
    add_index :tests, [:title, :level], unique: true 
  end
end
