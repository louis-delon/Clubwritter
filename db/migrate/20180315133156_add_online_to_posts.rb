class AddOnlineToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :online, :boolean
  end
end
