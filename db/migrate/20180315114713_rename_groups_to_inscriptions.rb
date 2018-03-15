class RenameGroupsToInscriptions < ActiveRecord::Migration[5.1]
  def change
    rename_table :groups, :inscriptions
  end
end
