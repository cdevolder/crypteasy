class CreateFavorites < ActiveRecord::Migration[5.1]
  def change
    create_table :favorites do |t|
      t.references :user, foreign_key: true
      t.references :crypto, foreign_key: true
      t.integer :platform1
      t.integer :platform2

      t.timestamps
    end
  end
end
