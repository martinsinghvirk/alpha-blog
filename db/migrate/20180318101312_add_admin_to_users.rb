class AddAdminToUsers < ActiveRecord::Migration[5.1]
  def change
    # Tabell, kolumnnamn, datatyp, default sätts den till false.
    add_column :users, :admin, :boolean, default: false
  end
end
