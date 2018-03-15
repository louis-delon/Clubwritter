class AddThemeRefToInscription < ActiveRecord::Migration[5.1]
  def change
    add_reference :inscriptions, :theme, foreign_key: true
  end
end
