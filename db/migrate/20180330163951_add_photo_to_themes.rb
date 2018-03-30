class AddPhotoToThemes < ActiveRecord::Migration[5.1]
  def change
    add_column :themes, :photo, :string
  end
end
