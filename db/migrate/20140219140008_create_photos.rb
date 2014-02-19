class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :caption
      t.string :submitter_id, null: false
      t.string :city_id

      t.timestamps
    end

    add_index :photos, :submitter_id
    add_index :photos, :city_id
  end
end
