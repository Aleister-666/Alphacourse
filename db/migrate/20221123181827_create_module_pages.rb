class CreateModulePages < ActiveRecord::Migration[7.0]
  def change
    create_table :module_pages do |t|
      t.string :title, null: false
      t.references :section, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
