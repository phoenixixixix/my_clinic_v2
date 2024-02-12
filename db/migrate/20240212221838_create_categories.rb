class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.string :title, index: { unique: true }, null: false

      t.timestamps
    end
  end
end
