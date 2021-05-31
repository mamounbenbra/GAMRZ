class ChangeSteamusernameToSteamUsername < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :steamusername, :Steam_Username
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
  end
end
