class ChangeTableAnswers < ActiveRecord::Migration[6.1]
  def up
    change_column :answers, :value, :integer
    change_column_default(:answers, :value, 0)
    change_column_null(:answers, :value, true)
  end

  def down
    change_column :answers, :value, :float
    change_column_default(:answers, :value, nil)
    change_column_null(:answers, :value, false)
  end

end
