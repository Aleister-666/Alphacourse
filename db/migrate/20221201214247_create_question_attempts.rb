class CreateQuestionAttempts < ActiveRecord::Migration[7.0]
  def change
    create_table :question_attempts do |t|
      t.decimal :max_score, precision: 12, scale: 7
      t.decimal :fraction, precision: 12, scale: 7
      t.references :quiz_attempt, null: false, foreign_key: { on_delete: :cascade }
      t.references :quiz_question, null: false, foreign_key: { on_delete: :cascade }
      t.references :question_answer, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
