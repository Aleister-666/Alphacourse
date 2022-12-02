class CreateQuizAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_attempts do |t|
      t.decimal :sum_scores, precision: 12, scale: 7
      t.references :module_quiz, null: false, foreign_key: { on_delete: :cascade }
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
