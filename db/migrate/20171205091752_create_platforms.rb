class CreatePlatforms < ActiveRecord::Migration[5.1]
  def change
    create_table :platforms do |t|
      t.string :name
      t.text :description
      t.integer :rating
      t.string :fees
      t.string :url

      t.timestamps
    end
  end
end
