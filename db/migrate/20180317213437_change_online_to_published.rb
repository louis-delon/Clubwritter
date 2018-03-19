class ChangeOnlineToPublished < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :online, :published
  end
end
