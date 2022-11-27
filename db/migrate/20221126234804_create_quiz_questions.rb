class CreateQuizQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_questions do |t|
      t.string :title, null: false
      t.decimal :score, precision: 12, scale: 7, default: 0
      t.integer :position
      t.integer :question_type, null: false, default: 1
      t.references :module_quiz, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
