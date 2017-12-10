class CreateAlerts < ActiveRecord::Migration[5.1]
  def change
    create_table :alerts do |t|
      t.references :favorite, foreign_key: true
      t.float :price
      t.string :option

      t.timestamps
    end
  end
end
