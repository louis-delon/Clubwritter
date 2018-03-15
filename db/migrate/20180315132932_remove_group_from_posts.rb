class RemoveGroupFromPosts < ActiveRecord::Migration[5.1]
  def change
    remove_index :posts, :group_id
    remove_column :posts, :group_id
  end
end

