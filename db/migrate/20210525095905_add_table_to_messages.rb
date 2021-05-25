class AddTableToMessages < ActiveRecord::Migration[6.0]
  def change
    add_column :messages, :chatroom_id, :integer
    add_foreign_key :messages, :chatrooms
  end
end
