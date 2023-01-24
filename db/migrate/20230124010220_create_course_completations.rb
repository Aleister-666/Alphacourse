class CreateCourseCompletations < ActiveRecord::Migration[7.0]
  def change
    create_table :course_completations do |t|
      t.references :course, null: false, foreign_key: { on_delete: :cascade}
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.boolean :completed, null: false, default: false

      t.timestamps
    end
  end
end
