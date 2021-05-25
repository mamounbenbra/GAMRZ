class AddReferencesToMatches < ActiveRecord::Migration[6.0]
  def change
    add_reference :matches, :chatroom
  end
end
