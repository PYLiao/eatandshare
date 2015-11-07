class AlterStaysAddUserIdColumn < ActiveRecord::Migration
  def change
  	add_column :stays, :usermodel_id, :integer
  	add_index :stays, :usermodel_id
  end
end
