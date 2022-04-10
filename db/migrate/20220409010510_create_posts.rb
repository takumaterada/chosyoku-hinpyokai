class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.integer :genre_id
      t.string :name, null: false
      t.text :discribe, null: false
      t.float :score_taste, null: false, default: "0"
      t.float :score_price, null: false, default: "0"
      t.float :score_stomach, null: false, default: "0"
      t.float :score_nutrition, null: false, default: "0"
      t.float :score_easy, null: false, default: "0"
      t.string :shop_name,null: false
      t.string :shop_address, null: false
      t.integer :shop_longitude, null: false
      t.integer :shop_latitude, null: false

      t.timestamps
    end
  end
end
