class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :name
      t.string :photo
      t.text :description
      t.references :category, index: true

      t.timestamps null: false
    end
    add_foreign_key :pictures, :categories
  end
end
