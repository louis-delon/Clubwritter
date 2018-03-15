class ChangeInscriptionTable < ActiveRecord::Migration[5.1]
  def change
    rename_column :inscriptions, :private, :accepted
    rename_column :inscriptions, :name, :comment
  end
end
