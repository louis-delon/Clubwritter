class AddDeadlineToThemes < ActiveRecord::Migration[5.1]
  def change
    add_column :themes, :deadline, :date
  end
end
