class DropInscriptionsTable < ActiveRecord::Migration[5.1]

  def change
    drop_table :inscriptions do |t|
      t.boolean :private
      t.timestamps null: false
    end
  end

end




