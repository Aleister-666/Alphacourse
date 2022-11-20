class CreateCoursesUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :courses_users do |t|
      t.references :course, null: false, foreign_key: { on_delete: :cascade }
      t.references :user, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
