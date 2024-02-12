class AddCategoryToUsers < ActiveRecord::Migration[7.1]
  def change
    add_belongs_to :users, :category
  end
end
