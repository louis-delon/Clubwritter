class AddCategoryRefToThemes < ActiveRecord::Migration[5.1]
  def change
    add_reference :themes, :category, foreign_key: true
  end
end
