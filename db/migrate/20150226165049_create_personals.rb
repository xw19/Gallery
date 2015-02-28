class CreatePersonals < ActiveRecord::Migration
  def change
    create_table :personals do |t|
      t.references :user, index: true
      t.string :first_name
      t.string :last_name
      t.date :date_of_birth
      t.string :gender
      t.text :about_me
      t.string :avatar

      t.timestamps null: false
    end
    add_foreign_key :personals, :users
  end
end
