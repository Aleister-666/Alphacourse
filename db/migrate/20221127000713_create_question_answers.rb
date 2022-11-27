class CreateQuestionAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :question_answers do |t|
      t.decimal :fraction, precision: 12, scale: 7, default: 0
      t.references :quiz_question, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
