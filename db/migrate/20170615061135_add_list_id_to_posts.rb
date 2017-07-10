class AddListIdToPosts < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :list_id, :integer
  end
end
