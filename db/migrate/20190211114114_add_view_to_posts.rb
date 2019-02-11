class AddViewToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :visit, :integer, default: 0
  end
end
