class AddAnswersColumnNullConstraint < ActiveRecord::Migration[7.0]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :value, false)
    change_column_null(:answers, :correct, false)
  end
end
