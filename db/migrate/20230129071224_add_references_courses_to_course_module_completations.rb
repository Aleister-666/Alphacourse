class AddReferencesCoursesToCourseModuleCompletations < ActiveRecord::Migration[7.0]
  def change
    add_reference :course_module_completations, :course, null: false, foreign_key: { on_delete: :cascade }
  end
end
