class CreateCourseModules < ActiveRecord::Migration[7.0]
  def change
    create_table :course_modules do |t|
      t.integer :position
      t.references :instanceable, polymorphic: true, null: false
      t.references :course, null: false, foreign_key: { on_delete: :cascade }
      t.references :section, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
