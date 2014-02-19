class CreatePhotoTaggings < ActiveRecord::Migration
  def change
    create_table :photo_taggings do |t|
      t.integer :photo_id, null: false
      t.integer :tag_id, null: false

      t.timestamps
    end
    add_index :photo_taggings, [:photo_id, :tag_id], uniqueness: true
    add_index :photo_taggings, :photo_id
    add_index :photo_taggings, :tag_id
  end
end
