class RemoveYuanFromExchangeTimeValue < ActiveRecord::Migration[5.1]
  def change
    remove_column :exchangetimevalues, :yuan, :float
  end
end
