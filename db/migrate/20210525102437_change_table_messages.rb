class ChangeTableMessages < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :to_user_id
    remove_column :messages, :from_user_id
    add_column :messages, :user_id, :integer
    add_foreign_key :messages, :users
  end
end
