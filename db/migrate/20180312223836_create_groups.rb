class CreateGroups < ActiveRecord::Migration[5.1]
  def change
    create_table :groups do |t|
      t.boolean :private

      t.timestamps
    end
  end
end
