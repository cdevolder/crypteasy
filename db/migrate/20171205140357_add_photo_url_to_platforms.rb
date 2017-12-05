class AddPhotoUrlToPlatforms < ActiveRecord::Migration[5.1]
  def change
    add_column :platforms, :photo_url, :string
  end
end
