class CreateSpaces < ActiveRecord::Migration[6.1]
  def change
    create_table :spaces do |t|
      t.string :location
      t.integer :capacity
      t.string :fee
      t.integer :size
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
