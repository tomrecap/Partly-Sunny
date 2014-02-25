class ChangeZipCodesToStrings < ActiveRecord::Migration
  def up
    change_column :zip_codes, :zip_code, :string
  end

  def down
    change_column :zip_codes, :zip_code, :integer
  end
end
