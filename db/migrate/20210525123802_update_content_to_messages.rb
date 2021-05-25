class UpdateContentToMessages < ActiveRecord::Migration[6.0]
  def change
    remove_column :messages, :content
    add_column :messages, :content, :string
  end
end
