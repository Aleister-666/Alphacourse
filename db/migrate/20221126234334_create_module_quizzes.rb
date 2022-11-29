class CreateModuleQuizzes < ActiveRecord::Migration[7.0]
  def change
    create_table :module_quizzes do |t|
      t.string :title, null: false
      t.decimal :value, precision: 12, scale: 7, default: 100
      t.decimal :min_value, precision: 12, scale: 7, default: 0
      t.decimal :sum_values, precision: 12, scale: 7, default: 0
      t.references :section, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
