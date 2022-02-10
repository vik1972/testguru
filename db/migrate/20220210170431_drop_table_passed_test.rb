class DropTablePassedTest < ActiveRecord::Migration[6.1]
  def up
    drop_table :passed_test, if_exists: true
  end
end
