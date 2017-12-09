class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|
      t.string :sku
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
