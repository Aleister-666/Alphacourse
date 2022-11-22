class CreateSections < ActiveRecord::Migration[7.0]
  def change
    create_table :sections do |t|
      t.string :title, null: false
      t.references :course, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
