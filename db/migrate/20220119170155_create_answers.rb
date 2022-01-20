class CreateAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :answers do |t|
      t.string :body
      t.float :value
      t.boolean :correct

      t.timestamps
    end
  end
end
