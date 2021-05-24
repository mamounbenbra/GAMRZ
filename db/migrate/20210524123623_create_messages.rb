class CreateMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :messages do |t|
      t.text :content
      t.integer :to_user_id
      t.integer :from_user_id

      t.timestamps
    end
  end
end
