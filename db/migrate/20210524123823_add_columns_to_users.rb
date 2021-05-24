class AddColumnsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :description, :text
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :username, :string
    add_column :users, :age, :integer
    add_column :users, :language, :string
    add_column :users, :rank, :string
    add_column :users, :style, :string
    add_column :users, :region, :string
    add_column :users, :playing_times, :string
  end
end
