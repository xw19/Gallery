class CreateFrontTiles < ActiveRecord::Migration
  def change
    create_table :front_tiles do |t|
      t.string :title
      t.string :link_url
      t.string :image_url

      t.timestamps null: false
    end
  end
end
