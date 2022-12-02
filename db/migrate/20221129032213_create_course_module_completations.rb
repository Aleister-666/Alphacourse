class CreateCourseModuleCompletations < ActiveRecord::Migration[7.0]
  def change
    create_table :course_module_completations do |t|
      t.references :course_module, null: false, foreign_key: { on_delete: :cascade }
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.boolean :complete, null: false, default: 0

      t.timestamps
    end
  end
end
