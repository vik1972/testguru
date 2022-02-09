class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.integer :value, default: 0
      t.boolean :correct, default: false, null: false
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
