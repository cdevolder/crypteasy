class CreateExchangetimevalues < ActiveRecord::Migration[5.1]
  def change
    create_table :exchangetimevalues do |t|
      t.float :euro
      t.float :dollar
      t.float :yuan
      t.references :platform, foreign_key: true
      t.references :crypto, foreign_key: true

      t.timestamps
    end
  end
end
