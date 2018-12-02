class Addindextopost < ActiveRecord::Migration[5.1]
  def change
    add_index :posts, :created_at
  end
end
