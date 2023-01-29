class AddCompletedToCoursesUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :courses_users, :completed, :boolean, default: false, null: false
  end
end
