class AllowBioToBeNull < ActiveRecord::Migration
  def up
    change_table :users do |t|
      t.change :bio, :string, limit: 140, null: true
    end
  end

  def down
    change_table :users do |t|
      t.change :bio, :string, limit: 140, null: false
    end
  end
end
