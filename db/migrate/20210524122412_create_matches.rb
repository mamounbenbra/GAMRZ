class CreateMatches < ActiveRecord::Migration[6.0]
  def change
    create_table :matches do |t|
      t.integer :from_user_id
      t.integer :to_user_id
      t.text :content_review
      t.integer :rating_review

      t.timestamps
    end
  end
end
