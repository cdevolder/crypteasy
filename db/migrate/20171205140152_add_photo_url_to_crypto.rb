class AddPhotoUrlToCrypto < ActiveRecord::Migration[5.1]
  def change
    add_column :cryptos, :photo_url, :string
  end
end
