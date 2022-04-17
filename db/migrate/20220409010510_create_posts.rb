class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :tag, null: false
      t.string :name, null: false
      t.text :describe, null: false
      t.float :score_taste, null: false, default: "0"
      t.float :score_price, null: false, default: "0"
      t.float :score_stomach, null: false, default: "0"
      t.float :score_nutrition, null: false, default: "0"
      t.float :score_easy, null: false, default: "0"
      t.string :shop_name
      t.string :shop_address
      t.float :shop_longitude
      t.float :shop_latitude

      t.timestamps
    end
  end
end
