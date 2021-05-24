class AddMutualToMatches < ActiveRecord::Migration[6.0]
  def change
    add_column :matches, :mutual, :boolean, default: false;
  end
end
