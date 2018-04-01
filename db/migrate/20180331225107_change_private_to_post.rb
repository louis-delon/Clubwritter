class ChangePrivateToPost < ActiveRecord::Migration[5.1]
  def change
    change_column :posts, :private, :boolean, default: false
  end
end
