class CreateReviews < ActiveRecord::Migration[7.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :stars
      t.references :driver, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true
      t.references :ride, null: false, foreign_key: true

      t.timestamps
    end
  end
end
