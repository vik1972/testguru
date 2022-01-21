class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :body, null: false
      t.float :value, null: false
      t.boolean :correct, default: false, null: false
      t.references :question

      t.timestamps
    end
  end
end
