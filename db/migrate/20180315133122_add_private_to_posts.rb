class AddPrivateToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :private, :boolean
  end
end
