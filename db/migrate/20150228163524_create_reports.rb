class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
      t.text :reason
      t.integer :user_id, index: true
      t.references :reportable, polymorphic: true, index: true

      t.timestamps null: false
    end
  end
end
