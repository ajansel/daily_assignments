class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.integer :poll_id, null: false
      t.string :question_text, null: false
      t.timestamps
    end

    add_index :questions, :poll_id
    add_index :questions, :question_text
  end
end
