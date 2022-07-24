class AddImageToSpaces < ActiveRecord::Migration[6.1]
  def change
    add_column :spaces, :image, :string
  end
end
