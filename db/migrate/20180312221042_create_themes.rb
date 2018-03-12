class CreateThemes < ActiveRecord::Migration[5.1]
  def change
    create_table :themes do |t|
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
