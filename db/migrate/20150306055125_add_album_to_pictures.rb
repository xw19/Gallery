class AddAlbumToPictures < ActiveRecord::Migration
  def change
    add_reference :pictures, :album, index: true
    add_foreign_key :pictures, :albums
  end
end
