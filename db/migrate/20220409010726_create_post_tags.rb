class CreatePostTags < ActiveRecord::Migration[6.1]
  def change
    create_table :post_tags do |t|
      t.integer :post_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
     # 同じタグを２回保存するのは出来ないようになる
    add_index :post_tags, [:post_id, :tag_id], unique: true
  end
end
