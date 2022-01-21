class CreateQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :questions do |t|
      t.string :body, null: false
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
