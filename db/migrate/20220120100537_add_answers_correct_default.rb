class AddAnswersCorrectDefault < ActiveRecord::Migration[7.0]
  def up
    change_column_default(:answers, :correct, false)
  end

  def down
    change_column_null(:answers, :correct, false)
  end
end
