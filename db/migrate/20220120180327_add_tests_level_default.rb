class AddTestsLevelDefault < ActiveRecord::Migration[7.0]
  def up
    change_column_default(:tests, :level, 0)
  end

  def down
    change_column_null(:tests, :level, true)
  end
end
