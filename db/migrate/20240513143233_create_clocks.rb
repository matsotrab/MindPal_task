class CreateClocks < ActiveRecord::Migration[7.1]
  def change
    create_table :clocks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :desc
      t.integer :category
      t.decimal :price
      t.string :photo_url

      t.timestamps
    end
  end
end
